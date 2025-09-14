//Shell with command History
#include "kernel/types.h"
#include "user/user.h"
#include "kernel/fcntl.h"

#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5

#define MAXARGS 10
#define MAX_HISTORY_LEN 100
#define MAX_LINE_LEN 100

//I have used a linked list implementation for history
struct list_elem {
  struct list_elem *prev;
  struct list_elem *next;
};

struct list {
  struct list_elem head;
  struct list_elem tail;
};

struct history_line {
  struct list_elem elem;
  int line_num;
  char line_str[MAX_LINE_LEN];
};

//History list (It is global)
struct list history;
int history_index = 1;

//String functions made for xv6
int my_strncmp(const char *s1, const char *s2, int n) {
  while(n > 0 && *s1 && (*s1 == *s2)) {
    s1++;
    s2++;
    n--;
  }
  if(n == 0)
    return 0;
  return (unsigned char)*s1 - (unsigned char)*s2;
}

void my_strncpy(char *dst, const char *src, int n) {
  int i;
  for(i = 0; i < n && src[i] != '\0'; i++)
    dst[i] = src[i];
  dst[i] = '\0';
}

//Functions for linked list
void list_init(struct list *list) {
  list->head.prev = 0;
  list->head.next = &list->tail;
  list->tail.prev = &list->head;
  list->tail.next = 0;
}

struct list_elem* list_head(struct list *list) {
  return &list->head;
}

struct list_elem* list_end(struct list *list) {
  return &list->tail;
}

struct list_elem* list_prev(struct list_elem *elem) {
  return elem->prev;
}

void list_push_back(struct list *list, struct list_elem *elem) {
  elem->prev = list->tail.prev;
  elem->next = &list->tail;
  list->tail.prev->next = elem;
  list->tail.prev = elem;
}

struct list_elem* list_pop_front(struct list *list) {
  struct list_elem *elem = list->head.next;
  if (elem == &list->tail)
    return 0;
  list->head.next = elem->next;
  elem->next->prev = &list->head;
  return elem;
}

#define list_entry(LIST_ELEM, STRUCT, MEMBER) \
  ((STRUCT *) ((char *) (LIST_ELEM) - (char *) &((STRUCT *) 0)->MEMBER))

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

int fork1(void);  //Fork
void panic(char*);
struct cmd *parsecmd(char*);
void runcmd(struct cmd*) __attribute__((noreturn));
void runcmd_builtin(char*);

// History functions
void history_add(char *buf) {
  struct history_line *hlp;
  struct list_elem *e;
  int off = 1;
  int len;

  hlp = (struct history_line *)malloc(sizeof(struct history_line));
  if(hlp == 0)
    panic("history_add(): malloc");
  hlp->line_str[0] = '\0';

  len = strlen(buf);
  if(buf[len-1] == '\n')
    off += 1;

  hlp->line_num = history_index;
  my_strncpy(hlp->line_str, buf, len - off);
  hlp->line_str[len - off] = '\0';  //Ensure that termination is done on null

  list_push_back(&history, &hlp->elem);
  if(history_index > MAX_HISTORY_LEN){
    e = list_pop_front(&history);
    hlp = list_entry(e, struct history_line, elem);
    free(hlp);
  }

  history_index += 1;
}

void history_show(void) {
    struct list_elem *e;
    struct history_line *hlp;
    int total = 0;
    int count = 0;

    //Counting total commands
    for(e = history.head.next; e != &history.tail; e = e->next)
        total++;

    int start = total > 10 ? total - 10 : 0;

    for(e = history.head.next; e != &history.tail; e = e->next){
        hlp = list_entry(e, struct history_line, elem);
        if(count >= start)
            printf("%d %s\n", hlp->line_num, hlp->line_str);
        count++;
    }
}

void history_run(char *buf) {
    struct list_elem *e;
    struct history_line *hlp;
    int index = 0;
    int found = 0;

    // Handle !!
    if(buf[0]=='!' && buf[1]=='!' && buf[2]==0){
        // Get last command
        if(history.tail.prev == &history.head){
            printf("-sh: no previous command\n");
            return;
        }
        hlp = list_entry(history.tail.prev, struct history_line, elem);
        printf("%s\n", hlp->line_str);
        runcmd_builtin(hlp->line_str);
        return;
    }

    // Handle !<number>
    if(buf[0]=='!' && buf[1]>='0' && buf[1]<='9'){
        index = atoi(&buf[1]);
        for(e = history.tail.prev; e != &history.head; e = e->prev){
            hlp = list_entry(e, struct history_line, elem);
            if(hlp->line_num == index){
                found = 1;
                break;
            }
        }
        if(found){
            printf("%s\n", hlp->line_str);
            runcmd_builtin(hlp->line_str);
        } else {
            printf("-sh: !%d: event not found\n", index);
        }
        return;
    }
}


//Execute builtin command without doing fork
void runcmd_builtin(char *cmd_str) {
  char buf[MAX_LINE_LEN];
  int i;
  
  //Copy the string of commands
  for(i = 0; cmd_str[i] != '\0' && i < MAX_LINE_LEN-2; i++)
    buf[i] = cmd_str[i];
  buf[i] = '\n';
  buf[i+1] = '\0';
  
  //Check for commands
  if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    buf[strlen(buf)-1] = 0;  // chop \n
    if(chdir(buf+3) < 0)
      fprintf(2, "cannot cd %s\n", buf+3);
  } else {
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(0);
  }
}

//Execute cmd
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit(1);

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit(1);
    exec(ecmd->argv[0], ecmd->argv);
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      fprintf(2, "open %s failed\n", rcmd->file);
      exit(1);
    }
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
    wait(0);
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
    close(p[1]);
    wait(0);
    wait(0);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
  write(2, "$ ", 2);
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

int
main(void)
{
  static char buf[100];
  int fd;

  //Initialize history linked list
  list_init(&history);

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }

  //Read and run input commands
  while(getcmd(buf, sizeof(buf)) >= 0){
    char *cmd = buf;
    while (*cmd == ' ' || *cmd == '\t')
      cmd++;
    if (*cmd == '\n') // is a blank command
      continue;
    
    //Check for commands
    if(strcmp(cmd, "history\n") == 0){
      history_show();
      continue;
    }
    
    //Check for !command
    if(cmd[0] == '!'){
      history_run(cmd);
      continue;
    }
    
    //Add command to history before it is run or executed
    history_add(cmd);

    if(cmd[0] == 'c' && cmd[1] == 'd' && cmd[2] == ' '){
      //Chdir called by the parent, not the child
      cmd[strlen(cmd)-1] = 0;
      if(chdir(cmd+3) < 0)
        fprintf(2, "cannot cd %s\n", cmd+3);
    } else {
      if(fork1() == 0)
        runcmd(parsecmd(cmd));
      wait(0);
    }
  }
  exit(0);
}

void
panic(char *s)
{
  fprintf(2, "%s\n", s);
  exit(1);
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    fprintf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
