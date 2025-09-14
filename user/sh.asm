
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <my_strncmp>:
//History list (It is global)
struct list history;
int history_index = 1;

//String functions made for xv6
int my_strncmp(const char *s1, const char *s2, int n) {
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
       8:	87aa                	mv	a5,a0
  while(n > 0 && *s1 && (*s1 == *s2)) {
       a:	02c05063          	blez	a2,2a <my_strncmp+0x2a>
       e:	0007c703          	lbu	a4,0(a5)
      12:	cf11                	beqz	a4,2e <my_strncmp+0x2e>
      14:	0005c683          	lbu	a3,0(a1)
      18:	00e69b63          	bne	a3,a4,2e <my_strncmp+0x2e>
    s1++;
      1c:	0785                	addi	a5,a5,1
    s2++;
      1e:	0585                	addi	a1,a1,1
    n--;
      20:	fff6051b          	addiw	a0,a2,-1
      24:	862a                	mv	a2,a0
  while(n > 0 && *s1 && (*s1 == *s2)) {
      26:	f565                	bnez	a0,e <my_strncmp+0xe>
      28:	a801                	j	38 <my_strncmp+0x38>
  }
  if(n == 0)
    return 0;
      2a:	8532                	mv	a0,a2
  if(n == 0)
      2c:	c611                	beqz	a2,38 <my_strncmp+0x38>
  return (unsigned char)*s1 - (unsigned char)*s2;
      2e:	0007c503          	lbu	a0,0(a5)
      32:	0005c783          	lbu	a5,0(a1)
      36:	9d1d                	subw	a0,a0,a5
}
      38:	60a2                	ld	ra,8(sp)
      3a:	6402                	ld	s0,0(sp)
      3c:	0141                	addi	sp,sp,16
      3e:	8082                	ret

0000000000000040 <my_strncpy>:

void my_strncpy(char *dst, const char *src, int n) {
      40:	1141                	addi	sp,sp,-16
      42:	e406                	sd	ra,8(sp)
      44:	e022                	sd	s0,0(sp)
      46:	0800                	addi	s0,sp,16
  int i;
  for(i = 0; i < n && src[i] != '\0'; i++)
      48:	02c05663          	blez	a2,74 <my_strncpy+0x34>
      4c:	86aa                	mv	a3,a0
      4e:	4781                	li	a5,0
      50:	0005c703          	lbu	a4,0(a1)
      54:	cb09                	beqz	a4,66 <my_strncpy+0x26>
    dst[i] = src[i];
      56:	00e68023          	sb	a4,0(a3)
  for(i = 0; i < n && src[i] != '\0'; i++)
      5a:	2785                	addiw	a5,a5,1
      5c:	0585                	addi	a1,a1,1
      5e:	0685                	addi	a3,a3,1
      60:	fef618e3          	bne	a2,a5,50 <my_strncpy+0x10>
      64:	87b2                	mv	a5,a2
  dst[i] = '\0';
      66:	953e                	add	a0,a0,a5
      68:	00050023          	sb	zero,0(a0)
}
      6c:	60a2                	ld	ra,8(sp)
      6e:	6402                	ld	s0,0(sp)
      70:	0141                	addi	sp,sp,16
      72:	8082                	ret
  for(i = 0; i < n && src[i] != '\0'; i++)
      74:	4781                	li	a5,0
      76:	bfc5                	j	66 <my_strncpy+0x26>

0000000000000078 <list_init>:

//Functions for linked list
void list_init(struct list *list) {
      78:	1141                	addi	sp,sp,-16
      7a:	e406                	sd	ra,8(sp)
      7c:	e022                	sd	s0,0(sp)
      7e:	0800                	addi	s0,sp,16
  list->head.prev = 0;
      80:	00053023          	sd	zero,0(a0)
  list->head.next = &list->tail;
      84:	01050793          	addi	a5,a0,16
      88:	e51c                	sd	a5,8(a0)
  list->tail.prev = &list->head;
      8a:	e908                	sd	a0,16(a0)
  list->tail.next = 0;
      8c:	00053c23          	sd	zero,24(a0)
}
      90:	60a2                	ld	ra,8(sp)
      92:	6402                	ld	s0,0(sp)
      94:	0141                	addi	sp,sp,16
      96:	8082                	ret

0000000000000098 <list_head>:

struct list_elem* list_head(struct list *list) {
      98:	1141                	addi	sp,sp,-16
      9a:	e406                	sd	ra,8(sp)
      9c:	e022                	sd	s0,0(sp)
      9e:	0800                	addi	s0,sp,16
  return &list->head;
}
      a0:	60a2                	ld	ra,8(sp)
      a2:	6402                	ld	s0,0(sp)
      a4:	0141                	addi	sp,sp,16
      a6:	8082                	ret

00000000000000a8 <list_end>:

struct list_elem* list_end(struct list *list) {
      a8:	1141                	addi	sp,sp,-16
      aa:	e406                	sd	ra,8(sp)
      ac:	e022                	sd	s0,0(sp)
      ae:	0800                	addi	s0,sp,16
  return &list->tail;
}
      b0:	0541                	addi	a0,a0,16
      b2:	60a2                	ld	ra,8(sp)
      b4:	6402                	ld	s0,0(sp)
      b6:	0141                	addi	sp,sp,16
      b8:	8082                	ret

00000000000000ba <list_prev>:

struct list_elem* list_prev(struct list_elem *elem) {
      ba:	1141                	addi	sp,sp,-16
      bc:	e406                	sd	ra,8(sp)
      be:	e022                	sd	s0,0(sp)
      c0:	0800                	addi	s0,sp,16
  return elem->prev;
}
      c2:	6108                	ld	a0,0(a0)
      c4:	60a2                	ld	ra,8(sp)
      c6:	6402                	ld	s0,0(sp)
      c8:	0141                	addi	sp,sp,16
      ca:	8082                	ret

00000000000000cc <list_push_back>:

void list_push_back(struct list *list, struct list_elem *elem) {
      cc:	1141                	addi	sp,sp,-16
      ce:	e406                	sd	ra,8(sp)
      d0:	e022                	sd	s0,0(sp)
      d2:	0800                	addi	s0,sp,16
  elem->prev = list->tail.prev;
      d4:	691c                	ld	a5,16(a0)
      d6:	e19c                	sd	a5,0(a1)
  elem->next = &list->tail;
      d8:	01050793          	addi	a5,a0,16
      dc:	e59c                	sd	a5,8(a1)
  list->tail.prev->next = elem;
      de:	691c                	ld	a5,16(a0)
      e0:	e78c                	sd	a1,8(a5)
  list->tail.prev = elem;
      e2:	e90c                	sd	a1,16(a0)
}
      e4:	60a2                	ld	ra,8(sp)
      e6:	6402                	ld	s0,0(sp)
      e8:	0141                	addi	sp,sp,16
      ea:	8082                	ret

00000000000000ec <list_pop_front>:

struct list_elem* list_pop_front(struct list *list) {
      ec:	1141                	addi	sp,sp,-16
      ee:	e406                	sd	ra,8(sp)
      f0:	e022                	sd	s0,0(sp)
      f2:	0800                	addi	s0,sp,16
      f4:	87aa                	mv	a5,a0
  struct list_elem *elem = list->head.next;
      f6:	6508                	ld	a0,8(a0)
  if (elem == &list->tail)
      f8:	01078713          	addi	a4,a5,16
      fc:	00e50963          	beq	a0,a4,10e <list_pop_front+0x22>
    return 0;
  list->head.next = elem->next;
     100:	6518                	ld	a4,8(a0)
     102:	e798                	sd	a4,8(a5)
  elem->next->prev = &list->head;
     104:	e31c                	sd	a5,0(a4)
  return elem;
}
     106:	60a2                	ld	ra,8(sp)
     108:	6402                	ld	s0,0(sp)
     10a:	0141                	addi	sp,sp,16
     10c:	8082                	ret
    return 0;
     10e:	4501                	li	a0,0
     110:	bfdd                	j	106 <list_pop_front+0x1a>

0000000000000112 <history_show>:
  }

  history_index += 1;
}

void history_show(void) {
     112:	7139                	addi	sp,sp,-64
     114:	fc06                	sd	ra,56(sp)
     116:	f822                	sd	s0,48(sp)
     118:	f426                	sd	s1,40(sp)
     11a:	0080                	addi	s0,sp,64
    struct history_line *hlp;
    int total = 0;
    int count = 0;

    //Counting total commands
    for(e = history.head.next; e != &history.tail; e = e->next)
     11c:	00002497          	auipc	s1,0x2
     120:	f1c4b483          	ld	s1,-228(s1) # 2038 <history+0x8>
     124:	00002797          	auipc	a5,0x2
     128:	f1c78793          	addi	a5,a5,-228 # 2040 <history+0x10>
     12c:	06f48363          	beq	s1,a5,192 <history_show+0x80>
     130:	f04a                	sd	s2,32(sp)
     132:	ec4e                	sd	s3,24(sp)
     134:	e852                	sd	s4,16(sp)
     136:	e456                	sd	s5,8(sp)
     138:	87a6                	mv	a5,s1
    int total = 0;
     13a:	4681                	li	a3,0
    for(e = history.head.next; e != &history.tail; e = e->next)
     13c:	00002617          	auipc	a2,0x2
     140:	f0460613          	addi	a2,a2,-252 # 2040 <history+0x10>
        total++;
     144:	0016871b          	addiw	a4,a3,1
     148:	86ba                	mv	a3,a4
    for(e = history.head.next; e != &history.tail; e = e->next)
     14a:	679c                	ld	a5,8(a5)
     14c:	fec79ce3          	bne	a5,a2,144 <history_show+0x32>

    int start = total > 10 ? total - 10 : 0;
     150:	89ba                	mv	s3,a4
     152:	47a9                	li	a5,10
     154:	00f75363          	bge	a4,a5,15a <history_show+0x48>
     158:	49a9                	li	s3,10
     15a:	39d9                	addiw	s3,s3,-10
    int count = 0;
     15c:	4901                	li	s2,0

    for(e = history.head.next; e != &history.tail; e = e->next){
        hlp = list_entry(e, struct history_line, elem);
        if(count >= start)
            printf("%d %s\n", hlp->line_num, hlp->line_str);
     15e:	00001a97          	auipc	s5,0x1
     162:	562a8a93          	addi	s5,s5,1378 # 16c0 <malloc+0xf8>
    for(e = history.head.next; e != &history.tail; e = e->next){
     166:	00002a17          	auipc	s4,0x2
     16a:	edaa0a13          	addi	s4,s4,-294 # 2040 <history+0x10>
     16e:	a029                	j	178 <history_show+0x66>
        count++;
     170:	2905                	addiw	s2,s2,1
    for(e = history.head.next; e != &history.tail; e = e->next){
     172:	6484                	ld	s1,8(s1)
     174:	01448b63          	beq	s1,s4,18a <history_show+0x78>
        if(count >= start)
     178:	ff394ce3          	blt	s2,s3,170 <history_show+0x5e>
            printf("%d %s\n", hlp->line_num, hlp->line_str);
     17c:	01448613          	addi	a2,s1,20
     180:	488c                	lw	a1,16(s1)
     182:	8556                	mv	a0,s5
     184:	38c010ef          	jal	1510 <printf>
     188:	b7e5                	j	170 <history_show+0x5e>
     18a:	7902                	ld	s2,32(sp)
     18c:	69e2                	ld	s3,24(sp)
     18e:	6a42                	ld	s4,16(sp)
     190:	6aa2                	ld	s5,8(sp)
    }
}
     192:	70e2                	ld	ra,56(sp)
     194:	7442                	ld	s0,48(sp)
     196:	74a2                	ld	s1,40(sp)
     198:	6121                	addi	sp,sp,64
     19a:	8082                	ret

000000000000019c <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     19c:	1101                	addi	sp,sp,-32
     19e:	ec06                	sd	ra,24(sp)
     1a0:	e822                	sd	s0,16(sp)
     1a2:	e426                	sd	s1,8(sp)
     1a4:	e04a                	sd	s2,0(sp)
     1a6:	1000                	addi	s0,sp,32
     1a8:	84aa                	mv	s1,a0
     1aa:	892e                	mv	s2,a1
  write(2, "$ ", 2);
     1ac:	4609                	li	a2,2
     1ae:	00001597          	auipc	a1,0x1
     1b2:	51a58593          	addi	a1,a1,1306 # 16c8 <malloc+0x100>
     1b6:	8532                	mv	a0,a2
     1b8:	733000ef          	jal	10ea <write>
  memset(buf, 0, nbuf);
     1bc:	864a                	mv	a2,s2
     1be:	4581                	li	a1,0
     1c0:	8526                	mv	a0,s1
     1c2:	4df000ef          	jal	ea0 <memset>
  gets(buf, nbuf);
     1c6:	85ca                	mv	a1,s2
     1c8:	8526                	mv	a0,s1
     1ca:	525000ef          	jal	eee <gets>
  if(buf[0] == 0) // EOF
     1ce:	0004c503          	lbu	a0,0(s1)
     1d2:	00153513          	seqz	a0,a0
    return -1;
  return 0;
}
     1d6:	40a0053b          	negw	a0,a0
     1da:	60e2                	ld	ra,24(sp)
     1dc:	6442                	ld	s0,16(sp)
     1de:	64a2                	ld	s1,8(sp)
     1e0:	6902                	ld	s2,0(sp)
     1e2:	6105                	addi	sp,sp,32
     1e4:	8082                	ret

00000000000001e6 <panic>:
  exit(0);
}

void
panic(char *s)
{
     1e6:	1141                	addi	sp,sp,-16
     1e8:	e406                	sd	ra,8(sp)
     1ea:	e022                	sd	s0,0(sp)
     1ec:	0800                	addi	s0,sp,16
     1ee:	862a                	mv	a2,a0
  fprintf(2, "%s\n", s);
     1f0:	00001597          	auipc	a1,0x1
     1f4:	4e058593          	addi	a1,a1,1248 # 16d0 <malloc+0x108>
     1f8:	4509                	li	a0,2
     1fa:	2ec010ef          	jal	14e6 <fprintf>
  exit(1);
     1fe:	4505                	li	a0,1
     200:	6cb000ef          	jal	10ca <exit>

0000000000000204 <history_add>:
void history_add(char *buf) {
     204:	7179                	addi	sp,sp,-48
     206:	f406                	sd	ra,40(sp)
     208:	f022                	sd	s0,32(sp)
     20a:	ec26                	sd	s1,24(sp)
     20c:	e84a                	sd	s2,16(sp)
     20e:	e44e                	sd	s3,8(sp)
     210:	e052                	sd	s4,0(sp)
     212:	1800                	addi	s0,sp,48
     214:	8a2a                	mv	s4,a0
  hlp = (struct history_line *)malloc(sizeof(struct history_line));
     216:	07800513          	li	a0,120
     21a:	3ae010ef          	jal	15c8 <malloc>
  if(hlp == 0)
     21e:	cd35                	beqz	a0,29a <history_add+0x96>
     220:	892a                	mv	s2,a0
  hlp->line_str[0] = '\0';
     222:	00050a23          	sb	zero,20(a0)
  len = strlen(buf);
     226:	8552                	mv	a0,s4
     228:	44d000ef          	jal	e74 <strlen>
  if(buf[len-1] == '\n')
     22c:	00aa07b3          	add	a5,s4,a0
     230:	fff7c783          	lbu	a5,-1(a5)
  int off = 1;
     234:	17d9                	addi	a5,a5,-10
     236:	0017b793          	seqz	a5,a5
     23a:	0785                	addi	a5,a5,1
  hlp->line_num = history_index;
     23c:	00002997          	auipc	s3,0x2
     240:	dd498993          	addi	s3,s3,-556 # 2010 <history_index>
     244:	0009a703          	lw	a4,0(s3)
     248:	00e92823          	sw	a4,16(s2)
  my_strncpy(hlp->line_str, buf, len - off);
     24c:	40f504bb          	subw	s1,a0,a5
     250:	8626                	mv	a2,s1
     252:	85d2                	mv	a1,s4
     254:	01490513          	addi	a0,s2,20
     258:	de9ff0ef          	jal	40 <my_strncpy>
  hlp->line_str[len - off] = '\0';  //Ensure that termination is done on null
     25c:	94ca                	add	s1,s1,s2
     25e:	00048a23          	sb	zero,20(s1)
  list_push_back(&history, &hlp->elem);
     262:	85ca                	mv	a1,s2
     264:	00002517          	auipc	a0,0x2
     268:	dcc50513          	addi	a0,a0,-564 # 2030 <history>
     26c:	e61ff0ef          	jal	cc <list_push_back>
  if(history_index > MAX_HISTORY_LEN){
     270:	0009a703          	lw	a4,0(s3)
     274:	06400793          	li	a5,100
     278:	02e7c763          	blt	a5,a4,2a6 <history_add+0xa2>
  history_index += 1;
     27c:	00002717          	auipc	a4,0x2
     280:	d9470713          	addi	a4,a4,-620 # 2010 <history_index>
     284:	431c                	lw	a5,0(a4)
     286:	2785                	addiw	a5,a5,1
     288:	c31c                	sw	a5,0(a4)
}
     28a:	70a2                	ld	ra,40(sp)
     28c:	7402                	ld	s0,32(sp)
     28e:	64e2                	ld	s1,24(sp)
     290:	6942                	ld	s2,16(sp)
     292:	69a2                	ld	s3,8(sp)
     294:	6a02                	ld	s4,0(sp)
     296:	6145                	addi	sp,sp,48
     298:	8082                	ret
    panic("history_add(): malloc");
     29a:	00001517          	auipc	a0,0x1
     29e:	43e50513          	addi	a0,a0,1086 # 16d8 <malloc+0x110>
     2a2:	f45ff0ef          	jal	1e6 <panic>
    e = list_pop_front(&history);
     2a6:	00002517          	auipc	a0,0x2
     2aa:	d8a50513          	addi	a0,a0,-630 # 2030 <history>
     2ae:	e3fff0ef          	jal	ec <list_pop_front>
    free(hlp);
     2b2:	290010ef          	jal	1542 <free>
     2b6:	b7d9                	j	27c <history_add+0x78>

00000000000002b8 <fork1>:
}

int
fork1(void)
{
     2b8:	1141                	addi	sp,sp,-16
     2ba:	e406                	sd	ra,8(sp)
     2bc:	e022                	sd	s0,0(sp)
     2be:	0800                	addi	s0,sp,16
  int pid;

  pid = fork();
     2c0:	603000ef          	jal	10c2 <fork>
  if(pid == -1)
     2c4:	57fd                	li	a5,-1
     2c6:	00f50663          	beq	a0,a5,2d2 <fork1+0x1a>
    panic("fork");
  return pid;
}
     2ca:	60a2                	ld	ra,8(sp)
     2cc:	6402                	ld	s0,0(sp)
     2ce:	0141                	addi	sp,sp,16
     2d0:	8082                	ret
    panic("fork");
     2d2:	00001517          	auipc	a0,0x1
     2d6:	41e50513          	addi	a0,a0,1054 # 16f0 <malloc+0x128>
     2da:	f0dff0ef          	jal	1e6 <panic>

00000000000002de <runcmd>:
{
     2de:	7179                	addi	sp,sp,-48
     2e0:	f406                	sd	ra,40(sp)
     2e2:	f022                	sd	s0,32(sp)
     2e4:	1800                	addi	s0,sp,48
  if(cmd == 0)
     2e6:	c115                	beqz	a0,30a <runcmd+0x2c>
     2e8:	ec26                	sd	s1,24(sp)
     2ea:	84aa                	mv	s1,a0
  switch(cmd->type){
     2ec:	4118                	lw	a4,0(a0)
     2ee:	4795                	li	a5,5
     2f0:	02e7e163          	bltu	a5,a4,312 <runcmd+0x34>
     2f4:	00056783          	lwu	a5,0(a0)
     2f8:	078a                	slli	a5,a5,0x2
     2fa:	00001717          	auipc	a4,0x1
     2fe:	54670713          	addi	a4,a4,1350 # 1840 <malloc+0x278>
     302:	97ba                	add	a5,a5,a4
     304:	439c                	lw	a5,0(a5)
     306:	97ba                	add	a5,a5,a4
     308:	8782                	jr	a5
     30a:	ec26                	sd	s1,24(sp)
    exit(1);
     30c:	4505                	li	a0,1
     30e:	5bd000ef          	jal	10ca <exit>
    panic("runcmd");
     312:	00001517          	auipc	a0,0x1
     316:	3e650513          	addi	a0,a0,998 # 16f8 <malloc+0x130>
     31a:	ecdff0ef          	jal	1e6 <panic>
    if(ecmd->argv[0] == 0)
     31e:	6508                	ld	a0,8(a0)
     320:	c105                	beqz	a0,340 <runcmd+0x62>
    exec(ecmd->argv[0], ecmd->argv);
     322:	00848593          	addi	a1,s1,8
     326:	5dd000ef          	jal	1102 <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
     32a:	6490                	ld	a2,8(s1)
     32c:	00001597          	auipc	a1,0x1
     330:	3d458593          	addi	a1,a1,980 # 1700 <malloc+0x138>
     334:	4509                	li	a0,2
     336:	1b0010ef          	jal	14e6 <fprintf>
  exit(0);
     33a:	4501                	li	a0,0
     33c:	58f000ef          	jal	10ca <exit>
      exit(1);
     340:	4505                	li	a0,1
     342:	589000ef          	jal	10ca <exit>
    close(rcmd->fd);
     346:	5148                	lw	a0,36(a0)
     348:	5ab000ef          	jal	10f2 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     34c:	508c                	lw	a1,32(s1)
     34e:	6888                	ld	a0,16(s1)
     350:	5bb000ef          	jal	110a <open>
     354:	00054563          	bltz	a0,35e <runcmd+0x80>
    runcmd(rcmd->cmd);
     358:	6488                	ld	a0,8(s1)
     35a:	f85ff0ef          	jal	2de <runcmd>
      fprintf(2, "open %s failed\n", rcmd->file);
     35e:	6890                	ld	a2,16(s1)
     360:	00001597          	auipc	a1,0x1
     364:	3b058593          	addi	a1,a1,944 # 1710 <malloc+0x148>
     368:	4509                	li	a0,2
     36a:	17c010ef          	jal	14e6 <fprintf>
      exit(1);
     36e:	4505                	li	a0,1
     370:	55b000ef          	jal	10ca <exit>
    if(fork1() == 0)
     374:	f45ff0ef          	jal	2b8 <fork1>
     378:	e501                	bnez	a0,380 <runcmd+0xa2>
      runcmd(lcmd->left);
     37a:	6488                	ld	a0,8(s1)
     37c:	f63ff0ef          	jal	2de <runcmd>
    wait(0);
     380:	4501                	li	a0,0
     382:	551000ef          	jal	10d2 <wait>
    runcmd(lcmd->right);
     386:	6888                	ld	a0,16(s1)
     388:	f57ff0ef          	jal	2de <runcmd>
    if(pipe(p) < 0)
     38c:	fd840513          	addi	a0,s0,-40
     390:	54b000ef          	jal	10da <pipe>
     394:	02054763          	bltz	a0,3c2 <runcmd+0xe4>
    if(fork1() == 0){
     398:	f21ff0ef          	jal	2b8 <fork1>
     39c:	e90d                	bnez	a0,3ce <runcmd+0xf0>
      close(1);
     39e:	4505                	li	a0,1
     3a0:	553000ef          	jal	10f2 <close>
      dup(p[1]);
     3a4:	fdc42503          	lw	a0,-36(s0)
     3a8:	59b000ef          	jal	1142 <dup>
      close(p[0]);
     3ac:	fd842503          	lw	a0,-40(s0)
     3b0:	543000ef          	jal	10f2 <close>
      close(p[1]);
     3b4:	fdc42503          	lw	a0,-36(s0)
     3b8:	53b000ef          	jal	10f2 <close>
      runcmd(pcmd->left);
     3bc:	6488                	ld	a0,8(s1)
     3be:	f21ff0ef          	jal	2de <runcmd>
      panic("pipe");
     3c2:	00001517          	auipc	a0,0x1
     3c6:	35e50513          	addi	a0,a0,862 # 1720 <malloc+0x158>
     3ca:	e1dff0ef          	jal	1e6 <panic>
    if(fork1() == 0){
     3ce:	eebff0ef          	jal	2b8 <fork1>
     3d2:	e115                	bnez	a0,3f6 <runcmd+0x118>
      close(0);
     3d4:	51f000ef          	jal	10f2 <close>
      dup(p[0]);
     3d8:	fd842503          	lw	a0,-40(s0)
     3dc:	567000ef          	jal	1142 <dup>
      close(p[0]);
     3e0:	fd842503          	lw	a0,-40(s0)
     3e4:	50f000ef          	jal	10f2 <close>
      close(p[1]);
     3e8:	fdc42503          	lw	a0,-36(s0)
     3ec:	507000ef          	jal	10f2 <close>
      runcmd(pcmd->right);
     3f0:	6888                	ld	a0,16(s1)
     3f2:	eedff0ef          	jal	2de <runcmd>
    close(p[0]);
     3f6:	fd842503          	lw	a0,-40(s0)
     3fa:	4f9000ef          	jal	10f2 <close>
    close(p[1]);
     3fe:	fdc42503          	lw	a0,-36(s0)
     402:	4f1000ef          	jal	10f2 <close>
    wait(0);
     406:	4501                	li	a0,0
     408:	4cb000ef          	jal	10d2 <wait>
    wait(0);
     40c:	4501                	li	a0,0
     40e:	4c5000ef          	jal	10d2 <wait>
    break;
     412:	b725                	j	33a <runcmd+0x5c>
    if(fork1() == 0)
     414:	ea5ff0ef          	jal	2b8 <fork1>
     418:	f20511e3          	bnez	a0,33a <runcmd+0x5c>
      runcmd(bcmd->cmd);
     41c:	6488                	ld	a0,8(s1)
     41e:	ec1ff0ef          	jal	2de <runcmd>

0000000000000422 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     422:	1101                	addi	sp,sp,-32
     424:	ec06                	sd	ra,24(sp)
     426:	e822                	sd	s0,16(sp)
     428:	e426                	sd	s1,8(sp)
     42a:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     42c:	0a800513          	li	a0,168
     430:	198010ef          	jal	15c8 <malloc>
     434:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     436:	0a800613          	li	a2,168
     43a:	4581                	li	a1,0
     43c:	265000ef          	jal	ea0 <memset>
  cmd->type = EXEC;
     440:	4785                	li	a5,1
     442:	c09c                	sw	a5,0(s1)
  return (struct cmd*)cmd;
}
     444:	8526                	mv	a0,s1
     446:	60e2                	ld	ra,24(sp)
     448:	6442                	ld	s0,16(sp)
     44a:	64a2                	ld	s1,8(sp)
     44c:	6105                	addi	sp,sp,32
     44e:	8082                	ret

0000000000000450 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     450:	7139                	addi	sp,sp,-64
     452:	fc06                	sd	ra,56(sp)
     454:	f822                	sd	s0,48(sp)
     456:	f426                	sd	s1,40(sp)
     458:	f04a                	sd	s2,32(sp)
     45a:	ec4e                	sd	s3,24(sp)
     45c:	e852                	sd	s4,16(sp)
     45e:	e456                	sd	s5,8(sp)
     460:	e05a                	sd	s6,0(sp)
     462:	0080                	addi	s0,sp,64
     464:	892a                	mv	s2,a0
     466:	89ae                	mv	s3,a1
     468:	8a32                	mv	s4,a2
     46a:	8ab6                	mv	s5,a3
     46c:	8b3a                	mv	s6,a4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     46e:	02800513          	li	a0,40
     472:	156010ef          	jal	15c8 <malloc>
     476:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     478:	02800613          	li	a2,40
     47c:	4581                	li	a1,0
     47e:	223000ef          	jal	ea0 <memset>
  cmd->type = REDIR;
     482:	4789                	li	a5,2
     484:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     486:	0124b423          	sd	s2,8(s1)
  cmd->file = file;
     48a:	0134b823          	sd	s3,16(s1)
  cmd->efile = efile;
     48e:	0144bc23          	sd	s4,24(s1)
  cmd->mode = mode;
     492:	0354a023          	sw	s5,32(s1)
  cmd->fd = fd;
     496:	0364a223          	sw	s6,36(s1)
  return (struct cmd*)cmd;
}
     49a:	8526                	mv	a0,s1
     49c:	70e2                	ld	ra,56(sp)
     49e:	7442                	ld	s0,48(sp)
     4a0:	74a2                	ld	s1,40(sp)
     4a2:	7902                	ld	s2,32(sp)
     4a4:	69e2                	ld	s3,24(sp)
     4a6:	6a42                	ld	s4,16(sp)
     4a8:	6aa2                	ld	s5,8(sp)
     4aa:	6b02                	ld	s6,0(sp)
     4ac:	6121                	addi	sp,sp,64
     4ae:	8082                	ret

00000000000004b0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     4b0:	7179                	addi	sp,sp,-48
     4b2:	f406                	sd	ra,40(sp)
     4b4:	f022                	sd	s0,32(sp)
     4b6:	ec26                	sd	s1,24(sp)
     4b8:	e84a                	sd	s2,16(sp)
     4ba:	e44e                	sd	s3,8(sp)
     4bc:	1800                	addi	s0,sp,48
     4be:	892a                	mv	s2,a0
     4c0:	89ae                	mv	s3,a1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4c2:	4561                	li	a0,24
     4c4:	104010ef          	jal	15c8 <malloc>
     4c8:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     4ca:	4661                	li	a2,24
     4cc:	4581                	li	a1,0
     4ce:	1d3000ef          	jal	ea0 <memset>
  cmd->type = PIPE;
     4d2:	478d                	li	a5,3
     4d4:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     4d6:	0124b423          	sd	s2,8(s1)
  cmd->right = right;
     4da:	0134b823          	sd	s3,16(s1)
  return (struct cmd*)cmd;
}
     4de:	8526                	mv	a0,s1
     4e0:	70a2                	ld	ra,40(sp)
     4e2:	7402                	ld	s0,32(sp)
     4e4:	64e2                	ld	s1,24(sp)
     4e6:	6942                	ld	s2,16(sp)
     4e8:	69a2                	ld	s3,8(sp)
     4ea:	6145                	addi	sp,sp,48
     4ec:	8082                	ret

00000000000004ee <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4ee:	7179                	addi	sp,sp,-48
     4f0:	f406                	sd	ra,40(sp)
     4f2:	f022                	sd	s0,32(sp)
     4f4:	ec26                	sd	s1,24(sp)
     4f6:	e84a                	sd	s2,16(sp)
     4f8:	e44e                	sd	s3,8(sp)
     4fa:	1800                	addi	s0,sp,48
     4fc:	892a                	mv	s2,a0
     4fe:	89ae                	mv	s3,a1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     500:	4561                	li	a0,24
     502:	0c6010ef          	jal	15c8 <malloc>
     506:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     508:	4661                	li	a2,24
     50a:	4581                	li	a1,0
     50c:	195000ef          	jal	ea0 <memset>
  cmd->type = LIST;
     510:	4791                	li	a5,4
     512:	c09c                	sw	a5,0(s1)
  cmd->left = left;
     514:	0124b423          	sd	s2,8(s1)
  cmd->right = right;
     518:	0134b823          	sd	s3,16(s1)
  return (struct cmd*)cmd;
}
     51c:	8526                	mv	a0,s1
     51e:	70a2                	ld	ra,40(sp)
     520:	7402                	ld	s0,32(sp)
     522:	64e2                	ld	s1,24(sp)
     524:	6942                	ld	s2,16(sp)
     526:	69a2                	ld	s3,8(sp)
     528:	6145                	addi	sp,sp,48
     52a:	8082                	ret

000000000000052c <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     52c:	1101                	addi	sp,sp,-32
     52e:	ec06                	sd	ra,24(sp)
     530:	e822                	sd	s0,16(sp)
     532:	e426                	sd	s1,8(sp)
     534:	e04a                	sd	s2,0(sp)
     536:	1000                	addi	s0,sp,32
     538:	892a                	mv	s2,a0
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     53a:	4541                	li	a0,16
     53c:	08c010ef          	jal	15c8 <malloc>
     540:	84aa                	mv	s1,a0
  memset(cmd, 0, sizeof(*cmd));
     542:	4641                	li	a2,16
     544:	4581                	li	a1,0
     546:	15b000ef          	jal	ea0 <memset>
  cmd->type = BACK;
     54a:	4795                	li	a5,5
     54c:	c09c                	sw	a5,0(s1)
  cmd->cmd = subcmd;
     54e:	0124b423          	sd	s2,8(s1)
  return (struct cmd*)cmd;
}
     552:	8526                	mv	a0,s1
     554:	60e2                	ld	ra,24(sp)
     556:	6442                	ld	s0,16(sp)
     558:	64a2                	ld	s1,8(sp)
     55a:	6902                	ld	s2,0(sp)
     55c:	6105                	addi	sp,sp,32
     55e:	8082                	ret

0000000000000560 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     560:	7139                	addi	sp,sp,-64
     562:	fc06                	sd	ra,56(sp)
     564:	f822                	sd	s0,48(sp)
     566:	f426                	sd	s1,40(sp)
     568:	f04a                	sd	s2,32(sp)
     56a:	ec4e                	sd	s3,24(sp)
     56c:	e852                	sd	s4,16(sp)
     56e:	e456                	sd	s5,8(sp)
     570:	e05a                	sd	s6,0(sp)
     572:	0080                	addi	s0,sp,64
     574:	8a2a                	mv	s4,a0
     576:	892e                	mv	s2,a1
     578:	8ab2                	mv	s5,a2
     57a:	8b36                	mv	s6,a3
  char *s;
  int ret;

  s = *ps;
     57c:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     57e:	00002997          	auipc	s3,0x2
     582:	a8a98993          	addi	s3,s3,-1398 # 2008 <whitespace>
     586:	00b4fc63          	bgeu	s1,a1,59e <gettoken+0x3e>
     58a:	0004c583          	lbu	a1,0(s1)
     58e:	854e                	mv	a0,s3
     590:	137000ef          	jal	ec6 <strchr>
     594:	c509                	beqz	a0,59e <gettoken+0x3e>
    s++;
     596:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     598:	fe9919e3          	bne	s2,s1,58a <gettoken+0x2a>
     59c:	84ca                	mv	s1,s2
  if(q)
     59e:	000a8463          	beqz	s5,5a6 <gettoken+0x46>
    *q = s;
     5a2:	009ab023          	sd	s1,0(s5)
  ret = *s;
     5a6:	0004c783          	lbu	a5,0(s1)
     5aa:	00078a9b          	sext.w	s5,a5
  switch(*s){
     5ae:	03c00713          	li	a4,60
     5b2:	06f76463          	bltu	a4,a5,61a <gettoken+0xba>
     5b6:	03a00713          	li	a4,58
     5ba:	00f76e63          	bltu	a4,a5,5d6 <gettoken+0x76>
     5be:	cf89                	beqz	a5,5d8 <gettoken+0x78>
     5c0:	02600713          	li	a4,38
     5c4:	00e78963          	beq	a5,a4,5d6 <gettoken+0x76>
     5c8:	fd87879b          	addiw	a5,a5,-40
     5cc:	0ff7f793          	zext.b	a5,a5
     5d0:	4705                	li	a4,1
     5d2:	06f76563          	bltu	a4,a5,63c <gettoken+0xdc>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5d6:	0485                	addi	s1,s1,1
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5d8:	000b0463          	beqz	s6,5e0 <gettoken+0x80>
    *eq = s;
     5dc:	009b3023          	sd	s1,0(s6)

  while(s < es && strchr(whitespace, *s))
     5e0:	00002997          	auipc	s3,0x2
     5e4:	a2898993          	addi	s3,s3,-1496 # 2008 <whitespace>
     5e8:	0124fc63          	bgeu	s1,s2,600 <gettoken+0xa0>
     5ec:	0004c583          	lbu	a1,0(s1)
     5f0:	854e                	mv	a0,s3
     5f2:	0d5000ef          	jal	ec6 <strchr>
     5f6:	c509                	beqz	a0,600 <gettoken+0xa0>
    s++;
     5f8:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     5fa:	fe9919e3          	bne	s2,s1,5ec <gettoken+0x8c>
     5fe:	84ca                	mv	s1,s2
  *ps = s;
     600:	009a3023          	sd	s1,0(s4)
  return ret;
}
     604:	8556                	mv	a0,s5
     606:	70e2                	ld	ra,56(sp)
     608:	7442                	ld	s0,48(sp)
     60a:	74a2                	ld	s1,40(sp)
     60c:	7902                	ld	s2,32(sp)
     60e:	69e2                	ld	s3,24(sp)
     610:	6a42                	ld	s4,16(sp)
     612:	6aa2                	ld	s5,8(sp)
     614:	6b02                	ld	s6,0(sp)
     616:	6121                	addi	sp,sp,64
     618:	8082                	ret
  switch(*s){
     61a:	03e00713          	li	a4,62
     61e:	00e79b63          	bne	a5,a4,634 <gettoken+0xd4>
    if(*s == '>'){
     622:	0014c703          	lbu	a4,1(s1)
     626:	03e00793          	li	a5,62
     62a:	04f70863          	beq	a4,a5,67a <gettoken+0x11a>
    s++;
     62e:	0485                	addi	s1,s1,1
  ret = *s;
     630:	8abe                	mv	s5,a5
     632:	b75d                	j	5d8 <gettoken+0x78>
  switch(*s){
     634:	07c00713          	li	a4,124
     638:	f8e78fe3          	beq	a5,a4,5d6 <gettoken+0x76>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     63c:	00002997          	auipc	s3,0x2
     640:	9cc98993          	addi	s3,s3,-1588 # 2008 <whitespace>
     644:	00002a97          	auipc	s5,0x2
     648:	9bca8a93          	addi	s5,s5,-1604 # 2000 <symbols>
     64c:	0524f163          	bgeu	s1,s2,68e <gettoken+0x12e>
     650:	0004c583          	lbu	a1,0(s1)
     654:	854e                	mv	a0,s3
     656:	071000ef          	jal	ec6 <strchr>
     65a:	e51d                	bnez	a0,688 <gettoken+0x128>
     65c:	0004c583          	lbu	a1,0(s1)
     660:	8556                	mv	a0,s5
     662:	065000ef          	jal	ec6 <strchr>
     666:	ed11                	bnez	a0,682 <gettoken+0x122>
      s++;
     668:	0485                	addi	s1,s1,1
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     66a:	fe9913e3          	bne	s2,s1,650 <gettoken+0xf0>
  if(eq)
     66e:	84ca                	mv	s1,s2
    ret = 'a';
     670:	06100a93          	li	s5,97
  if(eq)
     674:	f60b14e3          	bnez	s6,5dc <gettoken+0x7c>
     678:	b761                	j	600 <gettoken+0xa0>
      s++;
     67a:	0489                	addi	s1,s1,2
      ret = '+';
     67c:	02b00a93          	li	s5,43
     680:	bfa1                	j	5d8 <gettoken+0x78>
    ret = 'a';
     682:	06100a93          	li	s5,97
     686:	bf89                	j	5d8 <gettoken+0x78>
     688:	06100a93          	li	s5,97
     68c:	b7b1                	j	5d8 <gettoken+0x78>
     68e:	06100a93          	li	s5,97
  if(eq)
     692:	f40b15e3          	bnez	s6,5dc <gettoken+0x7c>
     696:	b7ad                	j	600 <gettoken+0xa0>

0000000000000698 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     698:	7139                	addi	sp,sp,-64
     69a:	fc06                	sd	ra,56(sp)
     69c:	f822                	sd	s0,48(sp)
     69e:	f426                	sd	s1,40(sp)
     6a0:	f04a                	sd	s2,32(sp)
     6a2:	ec4e                	sd	s3,24(sp)
     6a4:	e852                	sd	s4,16(sp)
     6a6:	e456                	sd	s5,8(sp)
     6a8:	0080                	addi	s0,sp,64
     6aa:	8a2a                	mv	s4,a0
     6ac:	892e                	mv	s2,a1
     6ae:	8ab2                	mv	s5,a2
  char *s;

  s = *ps;
     6b0:	6104                	ld	s1,0(a0)
  while(s < es && strchr(whitespace, *s))
     6b2:	00002997          	auipc	s3,0x2
     6b6:	95698993          	addi	s3,s3,-1706 # 2008 <whitespace>
     6ba:	00b4fc63          	bgeu	s1,a1,6d2 <peek+0x3a>
     6be:	0004c583          	lbu	a1,0(s1)
     6c2:	854e                	mv	a0,s3
     6c4:	003000ef          	jal	ec6 <strchr>
     6c8:	c509                	beqz	a0,6d2 <peek+0x3a>
    s++;
     6ca:	0485                	addi	s1,s1,1
  while(s < es && strchr(whitespace, *s))
     6cc:	fe9919e3          	bne	s2,s1,6be <peek+0x26>
     6d0:	84ca                	mv	s1,s2
  *ps = s;
     6d2:	009a3023          	sd	s1,0(s4)
  return *s && strchr(toks, *s);
     6d6:	0004c583          	lbu	a1,0(s1)
     6da:	4501                	li	a0,0
     6dc:	e991                	bnez	a1,6f0 <peek+0x58>
}
     6de:	70e2                	ld	ra,56(sp)
     6e0:	7442                	ld	s0,48(sp)
     6e2:	74a2                	ld	s1,40(sp)
     6e4:	7902                	ld	s2,32(sp)
     6e6:	69e2                	ld	s3,24(sp)
     6e8:	6a42                	ld	s4,16(sp)
     6ea:	6aa2                	ld	s5,8(sp)
     6ec:	6121                	addi	sp,sp,64
     6ee:	8082                	ret
  return *s && strchr(toks, *s);
     6f0:	8556                	mv	a0,s5
     6f2:	7d4000ef          	jal	ec6 <strchr>
     6f6:	00a03533          	snez	a0,a0
     6fa:	b7d5                	j	6de <peek+0x46>

00000000000006fc <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6fc:	7159                	addi	sp,sp,-112
     6fe:	f486                	sd	ra,104(sp)
     700:	f0a2                	sd	s0,96(sp)
     702:	eca6                	sd	s1,88(sp)
     704:	e8ca                	sd	s2,80(sp)
     706:	e4ce                	sd	s3,72(sp)
     708:	e0d2                	sd	s4,64(sp)
     70a:	fc56                	sd	s5,56(sp)
     70c:	f85a                	sd	s6,48(sp)
     70e:	f45e                	sd	s7,40(sp)
     710:	f062                	sd	s8,32(sp)
     712:	ec66                	sd	s9,24(sp)
     714:	1880                	addi	s0,sp,112
     716:	8a2a                	mv	s4,a0
     718:	89ae                	mv	s3,a1
     71a:	8932                	mv	s2,a2
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     71c:	00001b17          	auipc	s6,0x1
     720:	02cb0b13          	addi	s6,s6,44 # 1748 <malloc+0x180>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     724:	f9040c93          	addi	s9,s0,-112
     728:	f9840c13          	addi	s8,s0,-104
     72c:	06100b93          	li	s7,97
  while(peek(ps, es, "<>")){
     730:	a00d                	j	752 <parseredirs+0x56>
      panic("missing file for redirection");
     732:	00001517          	auipc	a0,0x1
     736:	ff650513          	addi	a0,a0,-10 # 1728 <malloc+0x160>
     73a:	aadff0ef          	jal	1e6 <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     73e:	4701                	li	a4,0
     740:	4681                	li	a3,0
     742:	f9043603          	ld	a2,-112(s0)
     746:	f9843583          	ld	a1,-104(s0)
     74a:	8552                	mv	a0,s4
     74c:	d05ff0ef          	jal	450 <redircmd>
     750:	8a2a                	mv	s4,a0
    switch(tok){
     752:	03c00a93          	li	s5,60
  while(peek(ps, es, "<>")){
     756:	865a                	mv	a2,s6
     758:	85ca                	mv	a1,s2
     75a:	854e                	mv	a0,s3
     75c:	f3dff0ef          	jal	698 <peek>
     760:	c135                	beqz	a0,7c4 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     762:	4681                	li	a3,0
     764:	4601                	li	a2,0
     766:	85ca                	mv	a1,s2
     768:	854e                	mv	a0,s3
     76a:	df7ff0ef          	jal	560 <gettoken>
     76e:	84aa                	mv	s1,a0
    if(gettoken(ps, es, &q, &eq) != 'a')
     770:	86e6                	mv	a3,s9
     772:	8662                	mv	a2,s8
     774:	85ca                	mv	a1,s2
     776:	854e                	mv	a0,s3
     778:	de9ff0ef          	jal	560 <gettoken>
     77c:	fb751be3          	bne	a0,s7,732 <parseredirs+0x36>
    switch(tok){
     780:	fb548fe3          	beq	s1,s5,73e <parseredirs+0x42>
     784:	03e00793          	li	a5,62
     788:	02f48263          	beq	s1,a5,7ac <parseredirs+0xb0>
     78c:	02b00793          	li	a5,43
     790:	fcf493e3          	bne	s1,a5,756 <parseredirs+0x5a>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     794:	4705                	li	a4,1
     796:	20100693          	li	a3,513
     79a:	f9043603          	ld	a2,-112(s0)
     79e:	f9843583          	ld	a1,-104(s0)
     7a2:	8552                	mv	a0,s4
     7a4:	cadff0ef          	jal	450 <redircmd>
     7a8:	8a2a                	mv	s4,a0
      break;
     7aa:	b765                	j	752 <parseredirs+0x56>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     7ac:	4705                	li	a4,1
     7ae:	60100693          	li	a3,1537
     7b2:	f9043603          	ld	a2,-112(s0)
     7b6:	f9843583          	ld	a1,-104(s0)
     7ba:	8552                	mv	a0,s4
     7bc:	c95ff0ef          	jal	450 <redircmd>
     7c0:	8a2a                	mv	s4,a0
      break;
     7c2:	bf41                	j	752 <parseredirs+0x56>
    }
  }
  return cmd;
}
     7c4:	8552                	mv	a0,s4
     7c6:	70a6                	ld	ra,104(sp)
     7c8:	7406                	ld	s0,96(sp)
     7ca:	64e6                	ld	s1,88(sp)
     7cc:	6946                	ld	s2,80(sp)
     7ce:	69a6                	ld	s3,72(sp)
     7d0:	6a06                	ld	s4,64(sp)
     7d2:	7ae2                	ld	s5,56(sp)
     7d4:	7b42                	ld	s6,48(sp)
     7d6:	7ba2                	ld	s7,40(sp)
     7d8:	7c02                	ld	s8,32(sp)
     7da:	6ce2                	ld	s9,24(sp)
     7dc:	6165                	addi	sp,sp,112
     7de:	8082                	ret

00000000000007e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     7e0:	7119                	addi	sp,sp,-128
     7e2:	fc86                	sd	ra,120(sp)
     7e4:	f8a2                	sd	s0,112(sp)
     7e6:	f4a6                	sd	s1,104(sp)
     7e8:	e8d2                	sd	s4,80(sp)
     7ea:	e4d6                	sd	s5,72(sp)
     7ec:	0100                	addi	s0,sp,128
     7ee:	8a2a                	mv	s4,a0
     7f0:	8aae                	mv	s5,a1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7f2:	00001617          	auipc	a2,0x1
     7f6:	f5e60613          	addi	a2,a2,-162 # 1750 <malloc+0x188>
     7fa:	e9fff0ef          	jal	698 <peek>
     7fe:	e121                	bnez	a0,83e <parseexec+0x5e>
     800:	f0ca                	sd	s2,96(sp)
     802:	ecce                	sd	s3,88(sp)
     804:	e0da                	sd	s6,64(sp)
     806:	fc5e                	sd	s7,56(sp)
     808:	f862                	sd	s8,48(sp)
     80a:	f466                	sd	s9,40(sp)
     80c:	f06a                	sd	s10,32(sp)
     80e:	ec6e                	sd	s11,24(sp)
     810:	892a                	mv	s2,a0
    return parseblock(ps, es);

  ret = execcmd();
     812:	c11ff0ef          	jal	422 <execcmd>
     816:	89aa                	mv	s3,a0
     818:	8daa                	mv	s11,a0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     81a:	8656                	mv	a2,s5
     81c:	85d2                	mv	a1,s4
     81e:	edfff0ef          	jal	6fc <parseredirs>
     822:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     824:	09a1                	addi	s3,s3,8
     826:	00001b17          	auipc	s6,0x1
     82a:	f4ab0b13          	addi	s6,s6,-182 # 1770 <malloc+0x1a8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     82e:	f8040c13          	addi	s8,s0,-128
     832:	f8840b93          	addi	s7,s0,-120
      break;
    if(tok != 'a')
     836:	06100d13          	li	s10,97
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
     83a:	4ca9                	li	s9,10
  while(!peek(ps, es, "|)&;")){
     83c:	a81d                	j	872 <parseexec+0x92>
    return parseblock(ps, es);
     83e:	85d6                	mv	a1,s5
     840:	8552                	mv	a0,s4
     842:	178000ef          	jal	9ba <parseblock>
     846:	84aa                	mv	s1,a0
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     848:	8526                	mv	a0,s1
     84a:	70e6                	ld	ra,120(sp)
     84c:	7446                	ld	s0,112(sp)
     84e:	74a6                	ld	s1,104(sp)
     850:	6a46                	ld	s4,80(sp)
     852:	6aa6                	ld	s5,72(sp)
     854:	6109                	addi	sp,sp,128
     856:	8082                	ret
      panic("syntax");
     858:	00001517          	auipc	a0,0x1
     85c:	f0050513          	addi	a0,a0,-256 # 1758 <malloc+0x190>
     860:	987ff0ef          	jal	1e6 <panic>
    if(argc >= MAXARGS)
     864:	09a1                	addi	s3,s3,8
    ret = parseredirs(ret, ps, es);
     866:	8656                	mv	a2,s5
     868:	85d2                	mv	a1,s4
     86a:	8526                	mv	a0,s1
     86c:	e91ff0ef          	jal	6fc <parseredirs>
     870:	84aa                	mv	s1,a0
  while(!peek(ps, es, "|)&;")){
     872:	865a                	mv	a2,s6
     874:	85d6                	mv	a1,s5
     876:	8552                	mv	a0,s4
     878:	e21ff0ef          	jal	698 <peek>
     87c:	e91d                	bnez	a0,8b2 <parseexec+0xd2>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     87e:	86e2                	mv	a3,s8
     880:	865e                	mv	a2,s7
     882:	85d6                	mv	a1,s5
     884:	8552                	mv	a0,s4
     886:	cdbff0ef          	jal	560 <gettoken>
     88a:	c505                	beqz	a0,8b2 <parseexec+0xd2>
    if(tok != 'a')
     88c:	fda516e3          	bne	a0,s10,858 <parseexec+0x78>
    cmd->argv[argc] = q;
     890:	f8843783          	ld	a5,-120(s0)
     894:	00f9b023          	sd	a5,0(s3)
    cmd->eargv[argc] = eq;
     898:	f8043783          	ld	a5,-128(s0)
     89c:	04f9b823          	sd	a5,80(s3)
    argc++;
     8a0:	2905                	addiw	s2,s2,1
    if(argc >= MAXARGS)
     8a2:	fd9911e3          	bne	s2,s9,864 <parseexec+0x84>
      panic("too many args");
     8a6:	00001517          	auipc	a0,0x1
     8aa:	eba50513          	addi	a0,a0,-326 # 1760 <malloc+0x198>
     8ae:	939ff0ef          	jal	1e6 <panic>
  cmd->argv[argc] = 0;
     8b2:	090e                	slli	s2,s2,0x3
     8b4:	012d87b3          	add	a5,s11,s2
     8b8:	0007b423          	sd	zero,8(a5)
  cmd->eargv[argc] = 0;
     8bc:	0407bc23          	sd	zero,88(a5)
     8c0:	7906                	ld	s2,96(sp)
     8c2:	69e6                	ld	s3,88(sp)
     8c4:	6b06                	ld	s6,64(sp)
     8c6:	7be2                	ld	s7,56(sp)
     8c8:	7c42                	ld	s8,48(sp)
     8ca:	7ca2                	ld	s9,40(sp)
     8cc:	7d02                	ld	s10,32(sp)
     8ce:	6de2                	ld	s11,24(sp)
  return ret;
     8d0:	bfa5                	j	848 <parseexec+0x68>

00000000000008d2 <parsepipe>:
{
     8d2:	7179                	addi	sp,sp,-48
     8d4:	f406                	sd	ra,40(sp)
     8d6:	f022                	sd	s0,32(sp)
     8d8:	ec26                	sd	s1,24(sp)
     8da:	e84a                	sd	s2,16(sp)
     8dc:	e44e                	sd	s3,8(sp)
     8de:	e052                	sd	s4,0(sp)
     8e0:	1800                	addi	s0,sp,48
     8e2:	892a                	mv	s2,a0
     8e4:	8a2a                	mv	s4,a0
     8e6:	84ae                	mv	s1,a1
  cmd = parseexec(ps, es);
     8e8:	ef9ff0ef          	jal	7e0 <parseexec>
     8ec:	89aa                	mv	s3,a0
  if(peek(ps, es, "|")){
     8ee:	00001617          	auipc	a2,0x1
     8f2:	e8a60613          	addi	a2,a2,-374 # 1778 <malloc+0x1b0>
     8f6:	85a6                	mv	a1,s1
     8f8:	854a                	mv	a0,s2
     8fa:	d9fff0ef          	jal	698 <peek>
     8fe:	e911                	bnez	a0,912 <parsepipe+0x40>
}
     900:	854e                	mv	a0,s3
     902:	70a2                	ld	ra,40(sp)
     904:	7402                	ld	s0,32(sp)
     906:	64e2                	ld	s1,24(sp)
     908:	6942                	ld	s2,16(sp)
     90a:	69a2                	ld	s3,8(sp)
     90c:	6a02                	ld	s4,0(sp)
     90e:	6145                	addi	sp,sp,48
     910:	8082                	ret
    gettoken(ps, es, 0, 0);
     912:	4681                	li	a3,0
     914:	4601                	li	a2,0
     916:	85a6                	mv	a1,s1
     918:	8552                	mv	a0,s4
     91a:	c47ff0ef          	jal	560 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     91e:	85a6                	mv	a1,s1
     920:	8552                	mv	a0,s4
     922:	fb1ff0ef          	jal	8d2 <parsepipe>
     926:	85aa                	mv	a1,a0
     928:	854e                	mv	a0,s3
     92a:	b87ff0ef          	jal	4b0 <pipecmd>
     92e:	89aa                	mv	s3,a0
  return cmd;
     930:	bfc1                	j	900 <parsepipe+0x2e>

0000000000000932 <parseline>:
{
     932:	7179                	addi	sp,sp,-48
     934:	f406                	sd	ra,40(sp)
     936:	f022                	sd	s0,32(sp)
     938:	ec26                	sd	s1,24(sp)
     93a:	e84a                	sd	s2,16(sp)
     93c:	e44e                	sd	s3,8(sp)
     93e:	e052                	sd	s4,0(sp)
     940:	1800                	addi	s0,sp,48
     942:	892a                	mv	s2,a0
     944:	89ae                	mv	s3,a1
  cmd = parsepipe(ps, es);
     946:	f8dff0ef          	jal	8d2 <parsepipe>
     94a:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     94c:	00001a17          	auipc	s4,0x1
     950:	e34a0a13          	addi	s4,s4,-460 # 1780 <malloc+0x1b8>
     954:	a819                	j	96a <parseline+0x38>
    gettoken(ps, es, 0, 0);
     956:	4681                	li	a3,0
     958:	4601                	li	a2,0
     95a:	85ce                	mv	a1,s3
     95c:	854a                	mv	a0,s2
     95e:	c03ff0ef          	jal	560 <gettoken>
    cmd = backcmd(cmd);
     962:	8526                	mv	a0,s1
     964:	bc9ff0ef          	jal	52c <backcmd>
     968:	84aa                	mv	s1,a0
  while(peek(ps, es, "&")){
     96a:	8652                	mv	a2,s4
     96c:	85ce                	mv	a1,s3
     96e:	854a                	mv	a0,s2
     970:	d29ff0ef          	jal	698 <peek>
     974:	f16d                	bnez	a0,956 <parseline+0x24>
  if(peek(ps, es, ";")){
     976:	00001617          	auipc	a2,0x1
     97a:	e1260613          	addi	a2,a2,-494 # 1788 <malloc+0x1c0>
     97e:	85ce                	mv	a1,s3
     980:	854a                	mv	a0,s2
     982:	d17ff0ef          	jal	698 <peek>
     986:	e911                	bnez	a0,99a <parseline+0x68>
}
     988:	8526                	mv	a0,s1
     98a:	70a2                	ld	ra,40(sp)
     98c:	7402                	ld	s0,32(sp)
     98e:	64e2                	ld	s1,24(sp)
     990:	6942                	ld	s2,16(sp)
     992:	69a2                	ld	s3,8(sp)
     994:	6a02                	ld	s4,0(sp)
     996:	6145                	addi	sp,sp,48
     998:	8082                	ret
    gettoken(ps, es, 0, 0);
     99a:	4681                	li	a3,0
     99c:	4601                	li	a2,0
     99e:	85ce                	mv	a1,s3
     9a0:	854a                	mv	a0,s2
     9a2:	bbfff0ef          	jal	560 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9a6:	85ce                	mv	a1,s3
     9a8:	854a                	mv	a0,s2
     9aa:	f89ff0ef          	jal	932 <parseline>
     9ae:	85aa                	mv	a1,a0
     9b0:	8526                	mv	a0,s1
     9b2:	b3dff0ef          	jal	4ee <listcmd>
     9b6:	84aa                	mv	s1,a0
  return cmd;
     9b8:	bfc1                	j	988 <parseline+0x56>

00000000000009ba <parseblock>:
{
     9ba:	7179                	addi	sp,sp,-48
     9bc:	f406                	sd	ra,40(sp)
     9be:	f022                	sd	s0,32(sp)
     9c0:	ec26                	sd	s1,24(sp)
     9c2:	e84a                	sd	s2,16(sp)
     9c4:	e44e                	sd	s3,8(sp)
     9c6:	1800                	addi	s0,sp,48
     9c8:	84aa                	mv	s1,a0
     9ca:	892e                	mv	s2,a1
  if(!peek(ps, es, "("))
     9cc:	00001617          	auipc	a2,0x1
     9d0:	d8460613          	addi	a2,a2,-636 # 1750 <malloc+0x188>
     9d4:	cc5ff0ef          	jal	698 <peek>
     9d8:	c539                	beqz	a0,a26 <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     9da:	4681                	li	a3,0
     9dc:	4601                	li	a2,0
     9de:	85ca                	mv	a1,s2
     9e0:	8526                	mv	a0,s1
     9e2:	b7fff0ef          	jal	560 <gettoken>
  cmd = parseline(ps, es);
     9e6:	85ca                	mv	a1,s2
     9e8:	8526                	mv	a0,s1
     9ea:	f49ff0ef          	jal	932 <parseline>
     9ee:	89aa                	mv	s3,a0
  if(!peek(ps, es, ")"))
     9f0:	00001617          	auipc	a2,0x1
     9f4:	db060613          	addi	a2,a2,-592 # 17a0 <malloc+0x1d8>
     9f8:	85ca                	mv	a1,s2
     9fa:	8526                	mv	a0,s1
     9fc:	c9dff0ef          	jal	698 <peek>
     a00:	c90d                	beqz	a0,a32 <parseblock+0x78>
  gettoken(ps, es, 0, 0);
     a02:	4681                	li	a3,0
     a04:	4601                	li	a2,0
     a06:	85ca                	mv	a1,s2
     a08:	8526                	mv	a0,s1
     a0a:	b57ff0ef          	jal	560 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a0e:	864a                	mv	a2,s2
     a10:	85a6                	mv	a1,s1
     a12:	854e                	mv	a0,s3
     a14:	ce9ff0ef          	jal	6fc <parseredirs>
}
     a18:	70a2                	ld	ra,40(sp)
     a1a:	7402                	ld	s0,32(sp)
     a1c:	64e2                	ld	s1,24(sp)
     a1e:	6942                	ld	s2,16(sp)
     a20:	69a2                	ld	s3,8(sp)
     a22:	6145                	addi	sp,sp,48
     a24:	8082                	ret
    panic("parseblock");
     a26:	00001517          	auipc	a0,0x1
     a2a:	d6a50513          	addi	a0,a0,-662 # 1790 <malloc+0x1c8>
     a2e:	fb8ff0ef          	jal	1e6 <panic>
    panic("syntax - missing )");
     a32:	00001517          	auipc	a0,0x1
     a36:	d7650513          	addi	a0,a0,-650 # 17a8 <malloc+0x1e0>
     a3a:	facff0ef          	jal	1e6 <panic>

0000000000000a3e <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a3e:	1101                	addi	sp,sp,-32
     a40:	ec06                	sd	ra,24(sp)
     a42:	e822                	sd	s0,16(sp)
     a44:	e426                	sd	s1,8(sp)
     a46:	1000                	addi	s0,sp,32
     a48:	84aa                	mv	s1,a0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a4a:	c131                	beqz	a0,a8e <nulterminate+0x50>
    return 0;

  switch(cmd->type){
     a4c:	4118                	lw	a4,0(a0)
     a4e:	4795                	li	a5,5
     a50:	02e7ef63          	bltu	a5,a4,a8e <nulterminate+0x50>
     a54:	00056783          	lwu	a5,0(a0)
     a58:	078a                	slli	a5,a5,0x2
     a5a:	00001717          	auipc	a4,0x1
     a5e:	dfe70713          	addi	a4,a4,-514 # 1858 <malloc+0x290>
     a62:	97ba                	add	a5,a5,a4
     a64:	439c                	lw	a5,0(a5)
     a66:	97ba                	add	a5,a5,a4
     a68:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a6a:	651c                	ld	a5,8(a0)
     a6c:	c38d                	beqz	a5,a8e <nulterminate+0x50>
     a6e:	01050793          	addi	a5,a0,16
      *ecmd->eargv[i] = 0;
     a72:	67b8                	ld	a4,72(a5)
     a74:	00070023          	sb	zero,0(a4)
    for(i=0; ecmd->argv[i]; i++)
     a78:	07a1                	addi	a5,a5,8
     a7a:	ff87b703          	ld	a4,-8(a5)
     a7e:	fb75                	bnez	a4,a72 <nulterminate+0x34>
     a80:	a039                	j	a8e <nulterminate+0x50>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a82:	6508                	ld	a0,8(a0)
     a84:	fbbff0ef          	jal	a3e <nulterminate>
    *rcmd->efile = 0;
     a88:	6c9c                	ld	a5,24(s1)
     a8a:	00078023          	sb	zero,0(a5)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a8e:	8526                	mv	a0,s1
     a90:	60e2                	ld	ra,24(sp)
     a92:	6442                	ld	s0,16(sp)
     a94:	64a2                	ld	s1,8(sp)
     a96:	6105                	addi	sp,sp,32
     a98:	8082                	ret
    nulterminate(pcmd->left);
     a9a:	6508                	ld	a0,8(a0)
     a9c:	fa3ff0ef          	jal	a3e <nulterminate>
    nulterminate(pcmd->right);
     aa0:	6888                	ld	a0,16(s1)
     aa2:	f9dff0ef          	jal	a3e <nulterminate>
    break;
     aa6:	b7e5                	j	a8e <nulterminate+0x50>
    nulterminate(lcmd->left);
     aa8:	6508                	ld	a0,8(a0)
     aaa:	f95ff0ef          	jal	a3e <nulterminate>
    nulterminate(lcmd->right);
     aae:	6888                	ld	a0,16(s1)
     ab0:	f8fff0ef          	jal	a3e <nulterminate>
    break;
     ab4:	bfe9                	j	a8e <nulterminate+0x50>
    nulterminate(bcmd->cmd);
     ab6:	6508                	ld	a0,8(a0)
     ab8:	f87ff0ef          	jal	a3e <nulterminate>
    break;
     abc:	bfc9                	j	a8e <nulterminate+0x50>

0000000000000abe <parsecmd>:
{
     abe:	7139                	addi	sp,sp,-64
     ac0:	fc06                	sd	ra,56(sp)
     ac2:	f822                	sd	s0,48(sp)
     ac4:	f426                	sd	s1,40(sp)
     ac6:	f04a                	sd	s2,32(sp)
     ac8:	ec4e                	sd	s3,24(sp)
     aca:	0080                	addi	s0,sp,64
     acc:	fca43423          	sd	a0,-56(s0)
  es = s + strlen(s);
     ad0:	84aa                	mv	s1,a0
     ad2:	3a2000ef          	jal	e74 <strlen>
     ad6:	1502                	slli	a0,a0,0x20
     ad8:	9101                	srli	a0,a0,0x20
     ada:	94aa                	add	s1,s1,a0
  cmd = parseline(&s, es);
     adc:	fc840913          	addi	s2,s0,-56
     ae0:	85a6                	mv	a1,s1
     ae2:	854a                	mv	a0,s2
     ae4:	e4fff0ef          	jal	932 <parseline>
     ae8:	89aa                	mv	s3,a0
  peek(&s, es, "");
     aea:	00001617          	auipc	a2,0x1
     aee:	d4660613          	addi	a2,a2,-698 # 1830 <malloc+0x268>
     af2:	85a6                	mv	a1,s1
     af4:	854a                	mv	a0,s2
     af6:	ba3ff0ef          	jal	698 <peek>
  if(s != es){
     afa:	fc843603          	ld	a2,-56(s0)
     afe:	00961d63          	bne	a2,s1,b18 <parsecmd+0x5a>
  nulterminate(cmd);
     b02:	854e                	mv	a0,s3
     b04:	f3bff0ef          	jal	a3e <nulterminate>
}
     b08:	854e                	mv	a0,s3
     b0a:	70e2                	ld	ra,56(sp)
     b0c:	7442                	ld	s0,48(sp)
     b0e:	74a2                	ld	s1,40(sp)
     b10:	7902                	ld	s2,32(sp)
     b12:	69e2                	ld	s3,24(sp)
     b14:	6121                	addi	sp,sp,64
     b16:	8082                	ret
    fprintf(2, "leftovers: %s\n", s);
     b18:	00001597          	auipc	a1,0x1
     b1c:	ca858593          	addi	a1,a1,-856 # 17c0 <malloc+0x1f8>
     b20:	4509                	li	a0,2
     b22:	1c5000ef          	jal	14e6 <fprintf>
    panic("syntax");
     b26:	00001517          	auipc	a0,0x1
     b2a:	c3250513          	addi	a0,a0,-974 # 1758 <malloc+0x190>
     b2e:	eb8ff0ef          	jal	1e6 <panic>

0000000000000b32 <runcmd_builtin>:
void runcmd_builtin(char *cmd_str) {
     b32:	7119                	addi	sp,sp,-128
     b34:	fc86                	sd	ra,120(sp)
     b36:	f8a2                	sd	s0,112(sp)
     b38:	0100                	addi	s0,sp,128
  for(i = 0; cmd_str[i] != '\0' && i < MAX_LINE_LEN-2; i++)
     b3a:	00054683          	lbu	a3,0(a0)
     b3e:	cab5                	beqz	a3,bb2 <runcmd_builtin+0x80>
     b40:	4785                	li	a5,1
    buf[i] = cmd_str[i];
     b42:	f8840593          	addi	a1,s0,-120
     b46:	00f58733          	add	a4,a1,a5
     b4a:	fed70fa3          	sb	a3,-1(a4)
  for(i = 0; cmd_str[i] != '\0' && i < MAX_LINE_LEN-2; i++)
     b4e:	00f50733          	add	a4,a0,a5
     b52:	00074683          	lbu	a3,0(a4)
     b56:	0007871b          	sext.w	a4,a5
     b5a:	06272713          	slti	a4,a4,98
     b5e:	00d03633          	snez	a2,a3
     b62:	8f71                	and	a4,a4,a2
     b64:	863e                	mv	a2,a5
     b66:	0785                	addi	a5,a5,1
     b68:	ff79                	bnez	a4,b46 <runcmd_builtin+0x14>
     b6a:	2601                	sext.w	a2,a2
  buf[i] = '\n';
     b6c:	ff060793          	addi	a5,a2,-16
     b70:	97a2                	add	a5,a5,s0
     b72:	4729                	li	a4,10
     b74:	f8e78c23          	sb	a4,-104(a5)
  buf[i+1] = '\0';
     b78:	2605                	addiw	a2,a2,1
     b7a:	ff060793          	addi	a5,a2,-16
     b7e:	00878633          	add	a2,a5,s0
     b82:	f8060c23          	sb	zero,-104(a2)
  if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     b86:	f8844703          	lbu	a4,-120(s0)
     b8a:	06300793          	li	a5,99
     b8e:	00f71863          	bne	a4,a5,b9e <runcmd_builtin+0x6c>
     b92:	f8944703          	lbu	a4,-119(s0)
     b96:	06400793          	li	a5,100
     b9a:	00f70e63          	beq	a4,a5,bb6 <runcmd_builtin+0x84>
    if(fork1() == 0)
     b9e:	f1aff0ef          	jal	2b8 <fork1>
     ba2:	cd21                	beqz	a0,bfa <runcmd_builtin+0xc8>
    wait(0);
     ba4:	4501                	li	a0,0
     ba6:	52c000ef          	jal	10d2 <wait>
}
     baa:	70e6                	ld	ra,120(sp)
     bac:	7446                	ld	s0,112(sp)
     bae:	6109                	addi	sp,sp,128
     bb0:	8082                	ret
  for(i = 0; cmd_str[i] != '\0' && i < MAX_LINE_LEN-2; i++)
     bb2:	4601                	li	a2,0
     bb4:	bf65                	j	b6c <runcmd_builtin+0x3a>
  if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     bb6:	f8a44703          	lbu	a4,-118(s0)
     bba:	02000793          	li	a5,32
     bbe:	fef710e3          	bne	a4,a5,b9e <runcmd_builtin+0x6c>
    buf[strlen(buf)-1] = 0;  // chop \n
     bc2:	f8840513          	addi	a0,s0,-120
     bc6:	2ae000ef          	jal	e74 <strlen>
     bca:	fff5079b          	addiw	a5,a0,-1
     bce:	1782                	slli	a5,a5,0x20
     bd0:	9381                	srli	a5,a5,0x20
     bd2:	17c1                	addi	a5,a5,-16
     bd4:	97a2                	add	a5,a5,s0
     bd6:	f8078c23          	sb	zero,-104(a5)
    if(chdir(buf+3) < 0)
     bda:	f8b40513          	addi	a0,s0,-117
     bde:	55c000ef          	jal	113a <chdir>
     be2:	fc0554e3          	bgez	a0,baa <runcmd_builtin+0x78>
      fprintf(2, "cannot cd %s\n", buf+3);
     be6:	f8b40613          	addi	a2,s0,-117
     bea:	00001597          	auipc	a1,0x1
     bee:	be658593          	addi	a1,a1,-1050 # 17d0 <malloc+0x208>
     bf2:	4509                	li	a0,2
     bf4:	0f3000ef          	jal	14e6 <fprintf>
     bf8:	bf4d                	j	baa <runcmd_builtin+0x78>
      runcmd(parsecmd(buf));
     bfa:	f8840513          	addi	a0,s0,-120
     bfe:	ec1ff0ef          	jal	abe <parsecmd>
     c02:	edcff0ef          	jal	2de <runcmd>

0000000000000c06 <history_run>:
    if(buf[0]=='!' && buf[1]=='!' && buf[2]==0){
     c06:	00054703          	lbu	a4,0(a0)
     c0a:	02100793          	li	a5,33
     c0e:	00f70363          	beq	a4,a5,c14 <history_run+0xe>
     c12:	8082                	ret
void history_run(char *buf) {
     c14:	1101                	addi	sp,sp,-32
     c16:	ec06                	sd	ra,24(sp)
     c18:	e822                	sd	s0,16(sp)
     c1a:	1000                	addi	s0,sp,32
    if(buf[0]=='!' && buf[1]=='!' && buf[2]==0){
     c1c:	00154783          	lbu	a5,1(a0)
     c20:	00e78d63          	beq	a5,a4,c3a <history_run+0x34>
    if(buf[0]=='!' && buf[1]>='0' && buf[1]<='9'){
     c24:	fd07879b          	addiw	a5,a5,-48
     c28:	0ff7f793          	zext.b	a5,a5
     c2c:	4725                	li	a4,9
     c2e:	04f77763          	bgeu	a4,a5,c7c <history_run+0x76>
}
     c32:	60e2                	ld	ra,24(sp)
     c34:	6442                	ld	s0,16(sp)
     c36:	6105                	addi	sp,sp,32
     c38:	8082                	ret
    if(buf[0]=='!' && buf[1]=='!' && buf[2]==0){
     c3a:	00254783          	lbu	a5,2(a0)
     c3e:	fbf5                	bnez	a5,c32 <history_run+0x2c>
        if(history.tail.prev == &history.head){
     c40:	00001797          	auipc	a5,0x1
     c44:	3f078793          	addi	a5,a5,1008 # 2030 <history>
     c48:	6b88                	ld	a0,16(a5)
     c4a:	02f50263          	beq	a0,a5,c6e <history_run+0x68>
     c4e:	e426                	sd	s1,8(sp)
        printf("%s\n", hlp->line_str);
     c50:	01450793          	addi	a5,a0,20
     c54:	84be                	mv	s1,a5
     c56:	85be                	mv	a1,a5
     c58:	00001517          	auipc	a0,0x1
     c5c:	a7850513          	addi	a0,a0,-1416 # 16d0 <malloc+0x108>
     c60:	0b1000ef          	jal	1510 <printf>
        runcmd_builtin(hlp->line_str);
     c64:	8526                	mv	a0,s1
     c66:	ecdff0ef          	jal	b32 <runcmd_builtin>
        return;
     c6a:	64a2                	ld	s1,8(sp)
     c6c:	b7d9                	j	c32 <history_run+0x2c>
            printf("-sh: no previous command\n");
     c6e:	00001517          	auipc	a0,0x1
     c72:	b7250513          	addi	a0,a0,-1166 # 17e0 <malloc+0x218>
     c76:	09b000ef          	jal	1510 <printf>
            return;
     c7a:	bf65                	j	c32 <history_run+0x2c>
        index = atoi(&buf[1]);
     c7c:	0505                	addi	a0,a0,1
     c7e:	322000ef          	jal	fa0 <atoi>
     c82:	85aa                	mv	a1,a0
        for(e = history.tail.prev; e != &history.head; e = e->prev){
     c84:	00001717          	auipc	a4,0x1
     c88:	3ac70713          	addi	a4,a4,940 # 2030 <history>
     c8c:	6b1c                	ld	a5,16(a4)
     c8e:	00e78963          	beq	a5,a4,ca0 <history_run+0x9a>
     c92:	86ba                	mv	a3,a4
            if(hlp->line_num == index){
     c94:	4b98                	lw	a4,16(a5)
     c96:	00b70c63          	beq	a4,a1,cae <history_run+0xa8>
        for(e = history.tail.prev; e != &history.head; e = e->prev){
     c9a:	639c                	ld	a5,0(a5)
     c9c:	fed79ce3          	bne	a5,a3,c94 <history_run+0x8e>
            printf("-sh: !%d: event not found\n", index);
     ca0:	00001517          	auipc	a0,0x1
     ca4:	b6050513          	addi	a0,a0,-1184 # 1800 <malloc+0x238>
     ca8:	069000ef          	jal	1510 <printf>
     cac:	b759                	j	c32 <history_run+0x2c>
     cae:	e426                	sd	s1,8(sp)
            printf("%s\n", hlp->line_str);
     cb0:	07d1                	addi	a5,a5,20
     cb2:	84be                	mv	s1,a5
     cb4:	85be                	mv	a1,a5
     cb6:	00001517          	auipc	a0,0x1
     cba:	a1a50513          	addi	a0,a0,-1510 # 16d0 <malloc+0x108>
     cbe:	053000ef          	jal	1510 <printf>
            runcmd_builtin(hlp->line_str);
     cc2:	8526                	mv	a0,s1
     cc4:	e6fff0ef          	jal	b32 <runcmd_builtin>
     cc8:	64a2                	ld	s1,8(sp)
     cca:	b7a5                	j	c32 <history_run+0x2c>

0000000000000ccc <main>:
{
     ccc:	7139                	addi	sp,sp,-64
     cce:	fc06                	sd	ra,56(sp)
     cd0:	f822                	sd	s0,48(sp)
     cd2:	f426                	sd	s1,40(sp)
     cd4:	f04a                	sd	s2,32(sp)
     cd6:	ec4e                	sd	s3,24(sp)
     cd8:	e852                	sd	s4,16(sp)
     cda:	e456                	sd	s5,8(sp)
     cdc:	e05a                	sd	s6,0(sp)
     cde:	0080                	addi	s0,sp,64
  list->head.prev = 0;
     ce0:	00001797          	auipc	a5,0x1
     ce4:	35078793          	addi	a5,a5,848 # 2030 <history>
     ce8:	0007b023          	sd	zero,0(a5)
  list->head.next = &list->tail;
     cec:	00001717          	auipc	a4,0x1
     cf0:	35470713          	addi	a4,a4,852 # 2040 <history+0x10>
     cf4:	e798                	sd	a4,8(a5)
  list->tail.prev = &list->head;
     cf6:	eb9c                	sd	a5,16(a5)
  list->tail.next = 0;
     cf8:	0007bc23          	sd	zero,24(a5)
  while((fd = open("console", O_RDWR)) >= 0){
     cfc:	4489                	li	s1,2
     cfe:	00001917          	auipc	s2,0x1
     d02:	b2290913          	addi	s2,s2,-1246 # 1820 <malloc+0x258>
     d06:	85a6                	mv	a1,s1
     d08:	854a                	mv	a0,s2
     d0a:	400000ef          	jal	110a <open>
     d0e:	00054663          	bltz	a0,d1a <main+0x4e>
    if(fd >= 3){
     d12:	fea4dae3          	bge	s1,a0,d06 <main+0x3a>
      close(fd);
     d16:	3dc000ef          	jal	10f2 <close>
  while(getcmd(buf, sizeof(buf)) >= 0){
     d1a:	06400913          	li	s2,100
     d1e:	00001997          	auipc	s3,0x1
     d22:	33298993          	addi	s3,s3,818 # 2050 <buf.0>
    while (*cmd == ' ' || *cmd == '\t')
     d26:	00001a97          	auipc	s5,0x1
     d2a:	30aa8a93          	addi	s5,s5,778 # 2030 <history>
    if (*cmd == '\n') // is a blank command
     d2e:	4a29                	li	s4,10
    if(strcmp(cmd, "history\n") == 0){
     d30:	00001b17          	auipc	s6,0x1
     d34:	af8b0b13          	addi	s6,s6,-1288 # 1828 <malloc+0x260>
     d38:	a831                	j	d54 <main+0x88>
      history_show();
     d3a:	bd8ff0ef          	jal	112 <history_show>
      continue;
     d3e:	a819                	j	d54 <main+0x88>
      history_run(cmd);
     d40:	8526                	mv	a0,s1
     d42:	ec5ff0ef          	jal	c06 <history_run>
      continue;
     d46:	a039                	j	d54 <main+0x88>
      if(fork1() == 0)
     d48:	d70ff0ef          	jal	2b8 <fork1>
     d4c:	cd45                	beqz	a0,e04 <main+0x138>
      wait(0);
     d4e:	4501                	li	a0,0
     d50:	382000ef          	jal	10d2 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     d54:	85ca                	mv	a1,s2
     d56:	854e                	mv	a0,s3
     d58:	c44ff0ef          	jal	19c <getcmd>
     d5c:	0a054963          	bltz	a0,e0e <main+0x142>
    while (*cmd == ' ' || *cmd == '\t')
     d60:	020ac783          	lbu	a5,32(s5)
     d64:	fe078713          	addi	a4,a5,-32
     d68:	cb01                	beqz	a4,d78 <main+0xac>
     d6a:	ff778713          	addi	a4,a5,-9
    char *cmd = buf;
     d6e:	00001497          	auipc	s1,0x1
     d72:	2e248493          	addi	s1,s1,738 # 2050 <buf.0>
    while (*cmd == ' ' || *cmd == '\t')
     d76:	ef11                	bnez	a4,d92 <main+0xc6>
    char *cmd = buf;
     d78:	00001497          	auipc	s1,0x1
     d7c:	2d848493          	addi	s1,s1,728 # 2050 <buf.0>
      cmd++;
     d80:	0485                	addi	s1,s1,1
    while (*cmd == ' ' || *cmd == '\t')
     d82:	0004c783          	lbu	a5,0(s1)
     d86:	fe078713          	addi	a4,a5,-32
     d8a:	db7d                	beqz	a4,d80 <main+0xb4>
     d8c:	ff778713          	addi	a4,a5,-9
     d90:	db65                	beqz	a4,d80 <main+0xb4>
    if (*cmd == '\n') // is a blank command
     d92:	fd4781e3          	beq	a5,s4,d54 <main+0x88>
    if(strcmp(cmd, "history\n") == 0){
     d96:	85da                	mv	a1,s6
     d98:	8526                	mv	a0,s1
     d9a:	0aa000ef          	jal	e44 <strcmp>
     d9e:	dd51                	beqz	a0,d3a <main+0x6e>
    if(cmd[0] == '!'){
     da0:	0004c703          	lbu	a4,0(s1)
     da4:	02100793          	li	a5,33
     da8:	f8f70ce3          	beq	a4,a5,d40 <main+0x74>
    history_add(cmd);
     dac:	8526                	mv	a0,s1
     dae:	c56ff0ef          	jal	204 <history_add>
    if(cmd[0] == 'c' && cmd[1] == 'd' && cmd[2] == ' '){
     db2:	0004c703          	lbu	a4,0(s1)
     db6:	06300793          	li	a5,99
     dba:	f8f717e3          	bne	a4,a5,d48 <main+0x7c>
     dbe:	0014c783          	lbu	a5,1(s1)
     dc2:	f92793e3          	bne	a5,s2,d48 <main+0x7c>
     dc6:	0024c703          	lbu	a4,2(s1)
     dca:	02000793          	li	a5,32
     dce:	f6f71de3          	bne	a4,a5,d48 <main+0x7c>
      cmd[strlen(cmd)-1] = 0;
     dd2:	8526                	mv	a0,s1
     dd4:	0a0000ef          	jal	e74 <strlen>
     dd8:	fff5079b          	addiw	a5,a0,-1
     ddc:	1782                	slli	a5,a5,0x20
     dde:	9381                	srli	a5,a5,0x20
     de0:	97a6                	add	a5,a5,s1
     de2:	00078023          	sb	zero,0(a5)
      if(chdir(cmd+3) < 0)
     de6:	048d                	addi	s1,s1,3
     de8:	8526                	mv	a0,s1
     dea:	350000ef          	jal	113a <chdir>
     dee:	f60553e3          	bgez	a0,d54 <main+0x88>
        fprintf(2, "cannot cd %s\n", cmd+3);
     df2:	8626                	mv	a2,s1
     df4:	00001597          	auipc	a1,0x1
     df8:	9dc58593          	addi	a1,a1,-1572 # 17d0 <malloc+0x208>
     dfc:	4509                	li	a0,2
     dfe:	6e8000ef          	jal	14e6 <fprintf>
     e02:	bf89                	j	d54 <main+0x88>
        runcmd(parsecmd(cmd));
     e04:	8526                	mv	a0,s1
     e06:	cb9ff0ef          	jal	abe <parsecmd>
     e0a:	cd4ff0ef          	jal	2de <runcmd>
  exit(0);
     e0e:	4501                	li	a0,0
     e10:	2ba000ef          	jal	10ca <exit>

0000000000000e14 <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start(int argc, char **argv)
{
     e14:	1141                	addi	sp,sp,-16
     e16:	e406                	sd	ra,8(sp)
     e18:	e022                	sd	s0,0(sp)
     e1a:	0800                	addi	s0,sp,16
  int r;
  extern int main(int argc, char **argv);
  r = main(argc, argv);
     e1c:	eb1ff0ef          	jal	ccc <main>
  exit(r);
     e20:	2aa000ef          	jal	10ca <exit>

0000000000000e24 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     e24:	1141                	addi	sp,sp,-16
     e26:	e406                	sd	ra,8(sp)
     e28:	e022                	sd	s0,0(sp)
     e2a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     e2c:	87aa                	mv	a5,a0
     e2e:	0585                	addi	a1,a1,1
     e30:	0785                	addi	a5,a5,1
     e32:	fff5c703          	lbu	a4,-1(a1)
     e36:	fee78fa3          	sb	a4,-1(a5)
     e3a:	fb75                	bnez	a4,e2e <strcpy+0xa>
    ;
  return os;
}
     e3c:	60a2                	ld	ra,8(sp)
     e3e:	6402                	ld	s0,0(sp)
     e40:	0141                	addi	sp,sp,16
     e42:	8082                	ret

0000000000000e44 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     e44:	1141                	addi	sp,sp,-16
     e46:	e406                	sd	ra,8(sp)
     e48:	e022                	sd	s0,0(sp)
     e4a:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     e4c:	00054783          	lbu	a5,0(a0)
     e50:	cb91                	beqz	a5,e64 <strcmp+0x20>
     e52:	0005c703          	lbu	a4,0(a1)
     e56:	00f71763          	bne	a4,a5,e64 <strcmp+0x20>
    p++, q++;
     e5a:	0505                	addi	a0,a0,1
     e5c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     e5e:	00054783          	lbu	a5,0(a0)
     e62:	fbe5                	bnez	a5,e52 <strcmp+0xe>
  return (uchar)*p - (uchar)*q;
     e64:	0005c503          	lbu	a0,0(a1)
}
     e68:	40a7853b          	subw	a0,a5,a0
     e6c:	60a2                	ld	ra,8(sp)
     e6e:	6402                	ld	s0,0(sp)
     e70:	0141                	addi	sp,sp,16
     e72:	8082                	ret

0000000000000e74 <strlen>:

uint
strlen(const char *s)
{
     e74:	1141                	addi	sp,sp,-16
     e76:	e406                	sd	ra,8(sp)
     e78:	e022                	sd	s0,0(sp)
     e7a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     e7c:	00054783          	lbu	a5,0(a0)
     e80:	cf91                	beqz	a5,e9c <strlen+0x28>
     e82:	00150793          	addi	a5,a0,1
     e86:	86be                	mv	a3,a5
     e88:	0785                	addi	a5,a5,1
     e8a:	fff7c703          	lbu	a4,-1(a5)
     e8e:	ff65                	bnez	a4,e86 <strlen+0x12>
     e90:	40a6853b          	subw	a0,a3,a0
    ;
  return n;
}
     e94:	60a2                	ld	ra,8(sp)
     e96:	6402                	ld	s0,0(sp)
     e98:	0141                	addi	sp,sp,16
     e9a:	8082                	ret
  for(n = 0; s[n]; n++)
     e9c:	4501                	li	a0,0
     e9e:	bfdd                	j	e94 <strlen+0x20>

0000000000000ea0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ea0:	1141                	addi	sp,sp,-16
     ea2:	e406                	sd	ra,8(sp)
     ea4:	e022                	sd	s0,0(sp)
     ea6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     ea8:	ca19                	beqz	a2,ebe <memset+0x1e>
     eaa:	87aa                	mv	a5,a0
     eac:	1602                	slli	a2,a2,0x20
     eae:	9201                	srli	a2,a2,0x20
     eb0:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     eb4:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     eb8:	0785                	addi	a5,a5,1
     eba:	fee79de3          	bne	a5,a4,eb4 <memset+0x14>
  }
  return dst;
}
     ebe:	60a2                	ld	ra,8(sp)
     ec0:	6402                	ld	s0,0(sp)
     ec2:	0141                	addi	sp,sp,16
     ec4:	8082                	ret

0000000000000ec6 <strchr>:

char*
strchr(const char *s, char c)
{
     ec6:	1141                	addi	sp,sp,-16
     ec8:	e406                	sd	ra,8(sp)
     eca:	e022                	sd	s0,0(sp)
     ecc:	0800                	addi	s0,sp,16
  for(; *s; s++)
     ece:	00054783          	lbu	a5,0(a0)
     ed2:	cf81                	beqz	a5,eea <strchr+0x24>
    if(*s == c)
     ed4:	00f58763          	beq	a1,a5,ee2 <strchr+0x1c>
  for(; *s; s++)
     ed8:	0505                	addi	a0,a0,1
     eda:	00054783          	lbu	a5,0(a0)
     ede:	fbfd                	bnez	a5,ed4 <strchr+0xe>
      return (char*)s;
  return 0;
     ee0:	4501                	li	a0,0
}
     ee2:	60a2                	ld	ra,8(sp)
     ee4:	6402                	ld	s0,0(sp)
     ee6:	0141                	addi	sp,sp,16
     ee8:	8082                	ret
  return 0;
     eea:	4501                	li	a0,0
     eec:	bfdd                	j	ee2 <strchr+0x1c>

0000000000000eee <gets>:

char*
gets(char *buf, int max)
{
     eee:	711d                	addi	sp,sp,-96
     ef0:	ec86                	sd	ra,88(sp)
     ef2:	e8a2                	sd	s0,80(sp)
     ef4:	e4a6                	sd	s1,72(sp)
     ef6:	e0ca                	sd	s2,64(sp)
     ef8:	fc4e                	sd	s3,56(sp)
     efa:	f852                	sd	s4,48(sp)
     efc:	f456                	sd	s5,40(sp)
     efe:	f05a                	sd	s6,32(sp)
     f00:	ec5e                	sd	s7,24(sp)
     f02:	e862                	sd	s8,16(sp)
     f04:	1080                	addi	s0,sp,96
     f06:	8baa                	mv	s7,a0
     f08:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     f0a:	892a                	mv	s2,a0
     f0c:	4481                	li	s1,0
    cc = read(0, &c, 1);
     f0e:	faf40b13          	addi	s6,s0,-81
     f12:	4a85                	li	s5,1
  for(i=0; i+1 < max; ){
     f14:	8c26                	mv	s8,s1
     f16:	0014899b          	addiw	s3,s1,1
     f1a:	84ce                	mv	s1,s3
     f1c:	0349d463          	bge	s3,s4,f44 <gets+0x56>
    cc = read(0, &c, 1);
     f20:	8656                	mv	a2,s5
     f22:	85da                	mv	a1,s6
     f24:	4501                	li	a0,0
     f26:	1bc000ef          	jal	10e2 <read>
    if(cc < 1)
     f2a:	00a05d63          	blez	a0,f44 <gets+0x56>
      break;
    buf[i++] = c;
     f2e:	faf44783          	lbu	a5,-81(s0)
     f32:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     f36:	0905                	addi	s2,s2,1
     f38:	ff678713          	addi	a4,a5,-10
     f3c:	c319                	beqz	a4,f42 <gets+0x54>
     f3e:	17cd                	addi	a5,a5,-13
     f40:	fbf1                	bnez	a5,f14 <gets+0x26>
    buf[i++] = c;
     f42:	8c4e                	mv	s8,s3
      break;
  }
  buf[i] = '\0';
     f44:	9c5e                	add	s8,s8,s7
     f46:	000c0023          	sb	zero,0(s8)
  return buf;
}
     f4a:	855e                	mv	a0,s7
     f4c:	60e6                	ld	ra,88(sp)
     f4e:	6446                	ld	s0,80(sp)
     f50:	64a6                	ld	s1,72(sp)
     f52:	6906                	ld	s2,64(sp)
     f54:	79e2                	ld	s3,56(sp)
     f56:	7a42                	ld	s4,48(sp)
     f58:	7aa2                	ld	s5,40(sp)
     f5a:	7b02                	ld	s6,32(sp)
     f5c:	6be2                	ld	s7,24(sp)
     f5e:	6c42                	ld	s8,16(sp)
     f60:	6125                	addi	sp,sp,96
     f62:	8082                	ret

0000000000000f64 <stat>:

int
stat(const char *n, struct stat *st)
{
     f64:	1101                	addi	sp,sp,-32
     f66:	ec06                	sd	ra,24(sp)
     f68:	e822                	sd	s0,16(sp)
     f6a:	e04a                	sd	s2,0(sp)
     f6c:	1000                	addi	s0,sp,32
     f6e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f70:	4581                	li	a1,0
     f72:	198000ef          	jal	110a <open>
  if(fd < 0)
     f76:	02054263          	bltz	a0,f9a <stat+0x36>
     f7a:	e426                	sd	s1,8(sp)
     f7c:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     f7e:	85ca                	mv	a1,s2
     f80:	1a2000ef          	jal	1122 <fstat>
     f84:	892a                	mv	s2,a0
  close(fd);
     f86:	8526                	mv	a0,s1
     f88:	16a000ef          	jal	10f2 <close>
  return r;
     f8c:	64a2                	ld	s1,8(sp)
}
     f8e:	854a                	mv	a0,s2
     f90:	60e2                	ld	ra,24(sp)
     f92:	6442                	ld	s0,16(sp)
     f94:	6902                	ld	s2,0(sp)
     f96:	6105                	addi	sp,sp,32
     f98:	8082                	ret
    return -1;
     f9a:	57fd                	li	a5,-1
     f9c:	893e                	mv	s2,a5
     f9e:	bfc5                	j	f8e <stat+0x2a>

0000000000000fa0 <atoi>:

int
atoi(const char *s)
{
     fa0:	1141                	addi	sp,sp,-16
     fa2:	e406                	sd	ra,8(sp)
     fa4:	e022                	sd	s0,0(sp)
     fa6:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     fa8:	00054683          	lbu	a3,0(a0)
     fac:	fd06879b          	addiw	a5,a3,-48
     fb0:	0ff7f793          	zext.b	a5,a5
     fb4:	4625                	li	a2,9
     fb6:	02f66963          	bltu	a2,a5,fe8 <atoi+0x48>
     fba:	872a                	mv	a4,a0
  n = 0;
     fbc:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
     fbe:	0705                	addi	a4,a4,1
     fc0:	0025179b          	slliw	a5,a0,0x2
     fc4:	9fa9                	addw	a5,a5,a0
     fc6:	0017979b          	slliw	a5,a5,0x1
     fca:	9fb5                	addw	a5,a5,a3
     fcc:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     fd0:	00074683          	lbu	a3,0(a4)
     fd4:	fd06879b          	addiw	a5,a3,-48
     fd8:	0ff7f793          	zext.b	a5,a5
     fdc:	fef671e3          	bgeu	a2,a5,fbe <atoi+0x1e>
  return n;
}
     fe0:	60a2                	ld	ra,8(sp)
     fe2:	6402                	ld	s0,0(sp)
     fe4:	0141                	addi	sp,sp,16
     fe6:	8082                	ret
  n = 0;
     fe8:	4501                	li	a0,0
     fea:	bfdd                	j	fe0 <atoi+0x40>

0000000000000fec <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     fec:	1141                	addi	sp,sp,-16
     fee:	e406                	sd	ra,8(sp)
     ff0:	e022                	sd	s0,0(sp)
     ff2:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     ff4:	02b57563          	bgeu	a0,a1,101e <memmove+0x32>
    while(n-- > 0)
     ff8:	00c05f63          	blez	a2,1016 <memmove+0x2a>
     ffc:	1602                	slli	a2,a2,0x20
     ffe:	9201                	srli	a2,a2,0x20
    1000:	00c507b3          	add	a5,a0,a2
  dst = vdst;
    1004:	872a                	mv	a4,a0
      *dst++ = *src++;
    1006:	0585                	addi	a1,a1,1
    1008:	0705                	addi	a4,a4,1
    100a:	fff5c683          	lbu	a3,-1(a1)
    100e:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    1012:	fee79ae3          	bne	a5,a4,1006 <memmove+0x1a>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    1016:	60a2                	ld	ra,8(sp)
    1018:	6402                	ld	s0,0(sp)
    101a:	0141                	addi	sp,sp,16
    101c:	8082                	ret
    while(n-- > 0)
    101e:	fec05ce3          	blez	a2,1016 <memmove+0x2a>
    dst += n;
    1022:	00c50733          	add	a4,a0,a2
    src += n;
    1026:	95b2                	add	a1,a1,a2
    1028:	fff6079b          	addiw	a5,a2,-1
    102c:	1782                	slli	a5,a5,0x20
    102e:	9381                	srli	a5,a5,0x20
    1030:	fff7c793          	not	a5,a5
    1034:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    1036:	15fd                	addi	a1,a1,-1
    1038:	177d                	addi	a4,a4,-1
    103a:	0005c683          	lbu	a3,0(a1)
    103e:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    1042:	fef71ae3          	bne	a4,a5,1036 <memmove+0x4a>
    1046:	bfc1                	j	1016 <memmove+0x2a>

0000000000001048 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1048:	1141                	addi	sp,sp,-16
    104a:	e406                	sd	ra,8(sp)
    104c:	e022                	sd	s0,0(sp)
    104e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    1050:	c61d                	beqz	a2,107e <memcmp+0x36>
    1052:	1602                	slli	a2,a2,0x20
    1054:	9201                	srli	a2,a2,0x20
    1056:	00c506b3          	add	a3,a0,a2
    if (*p1 != *p2) {
    105a:	00054783          	lbu	a5,0(a0)
    105e:	0005c703          	lbu	a4,0(a1)
    1062:	00e79863          	bne	a5,a4,1072 <memcmp+0x2a>
      return *p1 - *p2;
    }
    p1++;
    1066:	0505                	addi	a0,a0,1
    p2++;
    1068:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    106a:	fed518e3          	bne	a0,a3,105a <memcmp+0x12>
  }
  return 0;
    106e:	4501                	li	a0,0
    1070:	a019                	j	1076 <memcmp+0x2e>
      return *p1 - *p2;
    1072:	40e7853b          	subw	a0,a5,a4
}
    1076:	60a2                	ld	ra,8(sp)
    1078:	6402                	ld	s0,0(sp)
    107a:	0141                	addi	sp,sp,16
    107c:	8082                	ret
  return 0;
    107e:	4501                	li	a0,0
    1080:	bfdd                	j	1076 <memcmp+0x2e>

0000000000001082 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    1082:	1141                	addi	sp,sp,-16
    1084:	e406                	sd	ra,8(sp)
    1086:	e022                	sd	s0,0(sp)
    1088:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    108a:	f63ff0ef          	jal	fec <memmove>
}
    108e:	60a2                	ld	ra,8(sp)
    1090:	6402                	ld	s0,0(sp)
    1092:	0141                	addi	sp,sp,16
    1094:	8082                	ret

0000000000001096 <sbrk>:

char *
sbrk(int n) {
    1096:	1141                	addi	sp,sp,-16
    1098:	e406                	sd	ra,8(sp)
    109a:	e022                	sd	s0,0(sp)
    109c:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
    109e:	4585                	li	a1,1
    10a0:	0b2000ef          	jal	1152 <sys_sbrk>
}
    10a4:	60a2                	ld	ra,8(sp)
    10a6:	6402                	ld	s0,0(sp)
    10a8:	0141                	addi	sp,sp,16
    10aa:	8082                	ret

00000000000010ac <sbrklazy>:

char *
sbrklazy(int n) {
    10ac:	1141                	addi	sp,sp,-16
    10ae:	e406                	sd	ra,8(sp)
    10b0:	e022                	sd	s0,0(sp)
    10b2:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
    10b4:	4589                	li	a1,2
    10b6:	09c000ef          	jal	1152 <sys_sbrk>
}
    10ba:	60a2                	ld	ra,8(sp)
    10bc:	6402                	ld	s0,0(sp)
    10be:	0141                	addi	sp,sp,16
    10c0:	8082                	ret

00000000000010c2 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    10c2:	4885                	li	a7,1
 ecall
    10c4:	00000073          	ecall
 ret
    10c8:	8082                	ret

00000000000010ca <exit>:
.global exit
exit:
 li a7, SYS_exit
    10ca:	4889                	li	a7,2
 ecall
    10cc:	00000073          	ecall
 ret
    10d0:	8082                	ret

00000000000010d2 <wait>:
.global wait
wait:
 li a7, SYS_wait
    10d2:	488d                	li	a7,3
 ecall
    10d4:	00000073          	ecall
 ret
    10d8:	8082                	ret

00000000000010da <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    10da:	4891                	li	a7,4
 ecall
    10dc:	00000073          	ecall
 ret
    10e0:	8082                	ret

00000000000010e2 <read>:
.global read
read:
 li a7, SYS_read
    10e2:	4895                	li	a7,5
 ecall
    10e4:	00000073          	ecall
 ret
    10e8:	8082                	ret

00000000000010ea <write>:
.global write
write:
 li a7, SYS_write
    10ea:	48c1                	li	a7,16
 ecall
    10ec:	00000073          	ecall
 ret
    10f0:	8082                	ret

00000000000010f2 <close>:
.global close
close:
 li a7, SYS_close
    10f2:	48d5                	li	a7,21
 ecall
    10f4:	00000073          	ecall
 ret
    10f8:	8082                	ret

00000000000010fa <kill>:
.global kill
kill:
 li a7, SYS_kill
    10fa:	4899                	li	a7,6
 ecall
    10fc:	00000073          	ecall
 ret
    1100:	8082                	ret

0000000000001102 <exec>:
.global exec
exec:
 li a7, SYS_exec
    1102:	489d                	li	a7,7
 ecall
    1104:	00000073          	ecall
 ret
    1108:	8082                	ret

000000000000110a <open>:
.global open
open:
 li a7, SYS_open
    110a:	48bd                	li	a7,15
 ecall
    110c:	00000073          	ecall
 ret
    1110:	8082                	ret

0000000000001112 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    1112:	48c5                	li	a7,17
 ecall
    1114:	00000073          	ecall
 ret
    1118:	8082                	ret

000000000000111a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    111a:	48c9                	li	a7,18
 ecall
    111c:	00000073          	ecall
 ret
    1120:	8082                	ret

0000000000001122 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    1122:	48a1                	li	a7,8
 ecall
    1124:	00000073          	ecall
 ret
    1128:	8082                	ret

000000000000112a <link>:
.global link
link:
 li a7, SYS_link
    112a:	48cd                	li	a7,19
 ecall
    112c:	00000073          	ecall
 ret
    1130:	8082                	ret

0000000000001132 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1132:	48d1                	li	a7,20
 ecall
    1134:	00000073          	ecall
 ret
    1138:	8082                	ret

000000000000113a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    113a:	48a5                	li	a7,9
 ecall
    113c:	00000073          	ecall
 ret
    1140:	8082                	ret

0000000000001142 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1142:	48a9                	li	a7,10
 ecall
    1144:	00000073          	ecall
 ret
    1148:	8082                	ret

000000000000114a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    114a:	48ad                	li	a7,11
 ecall
    114c:	00000073          	ecall
 ret
    1150:	8082                	ret

0000000000001152 <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
    1152:	48b1                	li	a7,12
 ecall
    1154:	00000073          	ecall
 ret
    1158:	8082                	ret

000000000000115a <pause>:
.global pause
pause:
 li a7, SYS_pause
    115a:	48b5                	li	a7,13
 ecall
    115c:	00000073          	ecall
 ret
    1160:	8082                	ret

0000000000001162 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1162:	48b9                	li	a7,14
 ecall
    1164:	00000073          	ecall
 ret
    1168:	8082                	ret

000000000000116a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    116a:	1101                	addi	sp,sp,-32
    116c:	ec06                	sd	ra,24(sp)
    116e:	e822                	sd	s0,16(sp)
    1170:	1000                	addi	s0,sp,32
    1172:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    1176:	4605                	li	a2,1
    1178:	fef40593          	addi	a1,s0,-17
    117c:	f6fff0ef          	jal	10ea <write>
}
    1180:	60e2                	ld	ra,24(sp)
    1182:	6442                	ld	s0,16(sp)
    1184:	6105                	addi	sp,sp,32
    1186:	8082                	ret

0000000000001188 <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
    1188:	715d                	addi	sp,sp,-80
    118a:	e486                	sd	ra,72(sp)
    118c:	e0a2                	sd	s0,64(sp)
    118e:	f84a                	sd	s2,48(sp)
    1190:	f44e                	sd	s3,40(sp)
    1192:	0880                	addi	s0,sp,80
    1194:	892a                	mv	s2,a0
  char buf[20];
  int i, neg;
  unsigned long long x;

  neg = 0;
  if(sgn && xx < 0){
    1196:	c6d1                	beqz	a3,1222 <printint+0x9a>
    1198:	0805d563          	bgez	a1,1222 <printint+0x9a>
    neg = 1;
    x = -xx;
    119c:	40b005b3          	neg	a1,a1
    neg = 1;
    11a0:	4305                	li	t1,1
  } else {
    x = xx;
  }

  i = 0;
    11a2:	fb840993          	addi	s3,s0,-72
  neg = 0;
    11a6:	86ce                	mv	a3,s3
  i = 0;
    11a8:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    11aa:	00000817          	auipc	a6,0x0
    11ae:	6c680813          	addi	a6,a6,1734 # 1870 <digits>
    11b2:	88ba                	mv	a7,a4
    11b4:	0017051b          	addiw	a0,a4,1
    11b8:	872a                	mv	a4,a0
    11ba:	02c5f7b3          	remu	a5,a1,a2
    11be:	97c2                	add	a5,a5,a6
    11c0:	0007c783          	lbu	a5,0(a5)
    11c4:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
    11c8:	87ae                	mv	a5,a1
    11ca:	02c5d5b3          	divu	a1,a1,a2
    11ce:	0685                	addi	a3,a3,1
    11d0:	fec7f1e3          	bgeu	a5,a2,11b2 <printint+0x2a>
  if(neg)
    11d4:	00030c63          	beqz	t1,11ec <printint+0x64>
    buf[i++] = '-';
    11d8:	fd050793          	addi	a5,a0,-48
    11dc:	00878533          	add	a0,a5,s0
    11e0:	02d00793          	li	a5,45
    11e4:	fef50423          	sb	a5,-24(a0)
    11e8:	0028871b          	addiw	a4,a7,2

  while(--i >= 0)
    11ec:	02e05563          	blez	a4,1216 <printint+0x8e>
    11f0:	fc26                	sd	s1,56(sp)
    11f2:	377d                	addiw	a4,a4,-1
    11f4:	00e984b3          	add	s1,s3,a4
    11f8:	19fd                	addi	s3,s3,-1
    11fa:	99ba                	add	s3,s3,a4
    11fc:	1702                	slli	a4,a4,0x20
    11fe:	9301                	srli	a4,a4,0x20
    1200:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    1204:	0004c583          	lbu	a1,0(s1)
    1208:	854a                	mv	a0,s2
    120a:	f61ff0ef          	jal	116a <putc>
  while(--i >= 0)
    120e:	14fd                	addi	s1,s1,-1
    1210:	ff349ae3          	bne	s1,s3,1204 <printint+0x7c>
    1214:	74e2                	ld	s1,56(sp)
}
    1216:	60a6                	ld	ra,72(sp)
    1218:	6406                	ld	s0,64(sp)
    121a:	7942                	ld	s2,48(sp)
    121c:	79a2                	ld	s3,40(sp)
    121e:	6161                	addi	sp,sp,80
    1220:	8082                	ret
  neg = 0;
    1222:	4301                	li	t1,0
    1224:	bfbd                	j	11a2 <printint+0x1a>

0000000000001226 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1226:	711d                	addi	sp,sp,-96
    1228:	ec86                	sd	ra,88(sp)
    122a:	e8a2                	sd	s0,80(sp)
    122c:	e4a6                	sd	s1,72(sp)
    122e:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    1230:	0005c483          	lbu	s1,0(a1)
    1234:	22048363          	beqz	s1,145a <vprintf+0x234>
    1238:	e0ca                	sd	s2,64(sp)
    123a:	fc4e                	sd	s3,56(sp)
    123c:	f852                	sd	s4,48(sp)
    123e:	f456                	sd	s5,40(sp)
    1240:	f05a                	sd	s6,32(sp)
    1242:	ec5e                	sd	s7,24(sp)
    1244:	e862                	sd	s8,16(sp)
    1246:	8b2a                	mv	s6,a0
    1248:	8a2e                	mv	s4,a1
    124a:	8bb2                	mv	s7,a2
  state = 0;
    124c:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
    124e:	4901                	li	s2,0
    1250:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
    1252:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
    1256:	06400c13          	li	s8,100
    125a:	a00d                	j	127c <vprintf+0x56>
        putc(fd, c0);
    125c:	85a6                	mv	a1,s1
    125e:	855a                	mv	a0,s6
    1260:	f0bff0ef          	jal	116a <putc>
    1264:	a019                	j	126a <vprintf+0x44>
    } else if(state == '%'){
    1266:	03598363          	beq	s3,s5,128c <vprintf+0x66>
  for(i = 0; fmt[i]; i++){
    126a:	0019079b          	addiw	a5,s2,1
    126e:	893e                	mv	s2,a5
    1270:	873e                	mv	a4,a5
    1272:	97d2                	add	a5,a5,s4
    1274:	0007c483          	lbu	s1,0(a5)
    1278:	1c048a63          	beqz	s1,144c <vprintf+0x226>
    c0 = fmt[i] & 0xff;
    127c:	0004879b          	sext.w	a5,s1
    if(state == 0){
    1280:	fe0993e3          	bnez	s3,1266 <vprintf+0x40>
      if(c0 == '%'){
    1284:	fd579ce3          	bne	a5,s5,125c <vprintf+0x36>
        state = '%';
    1288:	89be                	mv	s3,a5
    128a:	b7c5                	j	126a <vprintf+0x44>
      if(c0) c1 = fmt[i+1] & 0xff;
    128c:	00ea06b3          	add	a3,s4,a4
    1290:	0016c603          	lbu	a2,1(a3)
      if(c1) c2 = fmt[i+2] & 0xff;
    1294:	1c060863          	beqz	a2,1464 <vprintf+0x23e>
      if(c0 == 'd'){
    1298:	03878763          	beq	a5,s8,12c6 <vprintf+0xa0>
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
    129c:	f9478693          	addi	a3,a5,-108
    12a0:	0016b693          	seqz	a3,a3
    12a4:	f9c60593          	addi	a1,a2,-100
    12a8:	e99d                	bnez	a1,12de <vprintf+0xb8>
    12aa:	ca95                	beqz	a3,12de <vprintf+0xb8>
        printint(fd, va_arg(ap, uint64), 10, 1);
    12ac:	008b8493          	addi	s1,s7,8
    12b0:	4685                	li	a3,1
    12b2:	4629                	li	a2,10
    12b4:	000bb583          	ld	a1,0(s7)
    12b8:	855a                	mv	a0,s6
    12ba:	ecfff0ef          	jal	1188 <printint>
        i += 1;
    12be:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 1);
    12c0:	8ba6                	mv	s7,s1
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
    12c2:	4981                	li	s3,0
    12c4:	b75d                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, int), 10, 1);
    12c6:	008b8493          	addi	s1,s7,8
    12ca:	4685                	li	a3,1
    12cc:	4629                	li	a2,10
    12ce:	000ba583          	lw	a1,0(s7)
    12d2:	855a                	mv	a0,s6
    12d4:	eb5ff0ef          	jal	1188 <printint>
    12d8:	8ba6                	mv	s7,s1
      state = 0;
    12da:	4981                	li	s3,0
    12dc:	b779                	j	126a <vprintf+0x44>
      if(c1) c2 = fmt[i+2] & 0xff;
    12de:	9752                	add	a4,a4,s4
    12e0:	00274583          	lbu	a1,2(a4)
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
    12e4:	f9460713          	addi	a4,a2,-108
    12e8:	00173713          	seqz	a4,a4
    12ec:	8f75                	and	a4,a4,a3
    12ee:	f9c58513          	addi	a0,a1,-100
    12f2:	18051363          	bnez	a0,1478 <vprintf+0x252>
    12f6:	18070163          	beqz	a4,1478 <vprintf+0x252>
        printint(fd, va_arg(ap, uint64), 10, 1);
    12fa:	008b8493          	addi	s1,s7,8
    12fe:	4685                	li	a3,1
    1300:	4629                	li	a2,10
    1302:	000bb583          	ld	a1,0(s7)
    1306:	855a                	mv	a0,s6
    1308:	e81ff0ef          	jal	1188 <printint>
        i += 2;
    130c:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 1);
    130e:	8ba6                	mv	s7,s1
      state = 0;
    1310:	4981                	li	s3,0
        i += 2;
    1312:	bfa1                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 10, 0);
    1314:	008b8493          	addi	s1,s7,8
    1318:	4681                	li	a3,0
    131a:	4629                	li	a2,10
    131c:	000be583          	lwu	a1,0(s7)
    1320:	855a                	mv	a0,s6
    1322:	e67ff0ef          	jal	1188 <printint>
    1326:	8ba6                	mv	s7,s1
      state = 0;
    1328:	4981                	li	s3,0
    132a:	b781                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
    132c:	008b8493          	addi	s1,s7,8
    1330:	4681                	li	a3,0
    1332:	4629                	li	a2,10
    1334:	000bb583          	ld	a1,0(s7)
    1338:	855a                	mv	a0,s6
    133a:	e4fff0ef          	jal	1188 <printint>
        i += 1;
    133e:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 0);
    1340:	8ba6                	mv	s7,s1
      state = 0;
    1342:	4981                	li	s3,0
    1344:	b71d                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1346:	008b8493          	addi	s1,s7,8
    134a:	4681                	li	a3,0
    134c:	4629                	li	a2,10
    134e:	000bb583          	ld	a1,0(s7)
    1352:	855a                	mv	a0,s6
    1354:	e35ff0ef          	jal	1188 <printint>
        i += 2;
    1358:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 0);
    135a:	8ba6                	mv	s7,s1
      state = 0;
    135c:	4981                	li	s3,0
        i += 2;
    135e:	b731                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 16, 0);
    1360:	008b8493          	addi	s1,s7,8
    1364:	4681                	li	a3,0
    1366:	4641                	li	a2,16
    1368:	000be583          	lwu	a1,0(s7)
    136c:	855a                	mv	a0,s6
    136e:	e1bff0ef          	jal	1188 <printint>
    1372:	8ba6                	mv	s7,s1
      state = 0;
    1374:	4981                	li	s3,0
    1376:	bdd5                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
    1378:	008b8493          	addi	s1,s7,8
    137c:	4681                	li	a3,0
    137e:	4641                	li	a2,16
    1380:	000bb583          	ld	a1,0(s7)
    1384:	855a                	mv	a0,s6
    1386:	e03ff0ef          	jal	1188 <printint>
        i += 1;
    138a:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 16, 0);
    138c:	8ba6                	mv	s7,s1
      state = 0;
    138e:	4981                	li	s3,0
    1390:	bde9                	j	126a <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
    1392:	008b8493          	addi	s1,s7,8
    1396:	4681                	li	a3,0
    1398:	4641                	li	a2,16
    139a:	000bb583          	ld	a1,0(s7)
    139e:	855a                	mv	a0,s6
    13a0:	de9ff0ef          	jal	1188 <printint>
        i += 2;
    13a4:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 16, 0);
    13a6:	8ba6                	mv	s7,s1
      state = 0;
    13a8:	4981                	li	s3,0
        i += 2;
    13aa:	b5c1                	j	126a <vprintf+0x44>
    13ac:	e466                	sd	s9,8(sp)
        printptr(fd, va_arg(ap, uint64));
    13ae:	008b8793          	addi	a5,s7,8
    13b2:	8cbe                	mv	s9,a5
    13b4:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
    13b8:	03000593          	li	a1,48
    13bc:	855a                	mv	a0,s6
    13be:	dadff0ef          	jal	116a <putc>
  putc(fd, 'x');
    13c2:	07800593          	li	a1,120
    13c6:	855a                	mv	a0,s6
    13c8:	da3ff0ef          	jal	116a <putc>
    13cc:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    13ce:	00000b97          	auipc	s7,0x0
    13d2:	4a2b8b93          	addi	s7,s7,1186 # 1870 <digits>
    13d6:	03c9d793          	srli	a5,s3,0x3c
    13da:	97de                	add	a5,a5,s7
    13dc:	0007c583          	lbu	a1,0(a5)
    13e0:	855a                	mv	a0,s6
    13e2:	d89ff0ef          	jal	116a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    13e6:	0992                	slli	s3,s3,0x4
    13e8:	34fd                	addiw	s1,s1,-1
    13ea:	f4f5                	bnez	s1,13d6 <vprintf+0x1b0>
        printptr(fd, va_arg(ap, uint64));
    13ec:	8be6                	mv	s7,s9
      state = 0;
    13ee:	4981                	li	s3,0
    13f0:	6ca2                	ld	s9,8(sp)
    13f2:	bda5                	j	126a <vprintf+0x44>
        putc(fd, va_arg(ap, uint32));
    13f4:	008b8493          	addi	s1,s7,8
    13f8:	000bc583          	lbu	a1,0(s7)
    13fc:	855a                	mv	a0,s6
    13fe:	d6dff0ef          	jal	116a <putc>
    1402:	8ba6                	mv	s7,s1
      state = 0;
    1404:	4981                	li	s3,0
    1406:	b595                	j	126a <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
    1408:	008b8993          	addi	s3,s7,8
    140c:	000bb483          	ld	s1,0(s7)
    1410:	cc91                	beqz	s1,142c <vprintf+0x206>
        for(; *s; s++)
    1412:	0004c583          	lbu	a1,0(s1)
    1416:	c985                	beqz	a1,1446 <vprintf+0x220>
          putc(fd, *s);
    1418:	855a                	mv	a0,s6
    141a:	d51ff0ef          	jal	116a <putc>
        for(; *s; s++)
    141e:	0485                	addi	s1,s1,1
    1420:	0004c583          	lbu	a1,0(s1)
    1424:	f9f5                	bnez	a1,1418 <vprintf+0x1f2>
        if((s = va_arg(ap, char*)) == 0)
    1426:	8bce                	mv	s7,s3
      state = 0;
    1428:	4981                	li	s3,0
    142a:	b581                	j	126a <vprintf+0x44>
          s = "(null)";
    142c:	00000497          	auipc	s1,0x0
    1430:	40c48493          	addi	s1,s1,1036 # 1838 <malloc+0x270>
        for(; *s; s++)
    1434:	02800593          	li	a1,40
    1438:	b7c5                	j	1418 <vprintf+0x1f2>
        putc(fd, '%');
    143a:	85be                	mv	a1,a5
    143c:	855a                	mv	a0,s6
    143e:	d2dff0ef          	jal	116a <putc>
      state = 0;
    1442:	4981                	li	s3,0
    1444:	b51d                	j	126a <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
    1446:	8bce                	mv	s7,s3
      state = 0;
    1448:	4981                	li	s3,0
    144a:	b505                	j	126a <vprintf+0x44>
    144c:	6906                	ld	s2,64(sp)
    144e:	79e2                	ld	s3,56(sp)
    1450:	7a42                	ld	s4,48(sp)
    1452:	7aa2                	ld	s5,40(sp)
    1454:	7b02                	ld	s6,32(sp)
    1456:	6be2                	ld	s7,24(sp)
    1458:	6c42                	ld	s8,16(sp)
    }
  }
}
    145a:	60e6                	ld	ra,88(sp)
    145c:	6446                	ld	s0,80(sp)
    145e:	64a6                	ld	s1,72(sp)
    1460:	6125                	addi	sp,sp,96
    1462:	8082                	ret
      if(c0 == 'd'){
    1464:	06400713          	li	a4,100
    1468:	e4e78fe3          	beq	a5,a4,12c6 <vprintf+0xa0>
      } else if(c0 == 'l' && c1 == 'd'){
    146c:	f9478693          	addi	a3,a5,-108
    1470:	0016b693          	seqz	a3,a3
      c1 = c2 = 0;
    1474:	85b2                	mv	a1,a2
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
    1476:	4701                	li	a4,0
      } else if(c0 == 'u'){
    1478:	07500513          	li	a0,117
    147c:	e8a78ce3          	beq	a5,a0,1314 <vprintf+0xee>
      } else if(c0 == 'l' && c1 == 'u'){
    1480:	f8b60513          	addi	a0,a2,-117
    1484:	e119                	bnez	a0,148a <vprintf+0x264>
    1486:	ea0693e3          	bnez	a3,132c <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
    148a:	f8b58513          	addi	a0,a1,-117
    148e:	e119                	bnez	a0,1494 <vprintf+0x26e>
    1490:	ea071be3          	bnez	a4,1346 <vprintf+0x120>
      } else if(c0 == 'x'){
    1494:	07800513          	li	a0,120
    1498:	eca784e3          	beq	a5,a0,1360 <vprintf+0x13a>
      } else if(c0 == 'l' && c1 == 'x'){
    149c:	f8860613          	addi	a2,a2,-120
    14a0:	e219                	bnez	a2,14a6 <vprintf+0x280>
    14a2:	ec069be3          	bnez	a3,1378 <vprintf+0x152>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
    14a6:	f8858593          	addi	a1,a1,-120
    14aa:	e199                	bnez	a1,14b0 <vprintf+0x28a>
    14ac:	ee0713e3          	bnez	a4,1392 <vprintf+0x16c>
      } else if(c0 == 'p'){
    14b0:	07000713          	li	a4,112
    14b4:	eee78ce3          	beq	a5,a4,13ac <vprintf+0x186>
      } else if(c0 == 'c'){
    14b8:	06300713          	li	a4,99
    14bc:	f2e78ce3          	beq	a5,a4,13f4 <vprintf+0x1ce>
      } else if(c0 == 's'){
    14c0:	07300713          	li	a4,115
    14c4:	f4e782e3          	beq	a5,a4,1408 <vprintf+0x1e2>
      } else if(c0 == '%'){
    14c8:	02500713          	li	a4,37
    14cc:	f6e787e3          	beq	a5,a4,143a <vprintf+0x214>
        putc(fd, '%');
    14d0:	02500593          	li	a1,37
    14d4:	855a                	mv	a0,s6
    14d6:	c95ff0ef          	jal	116a <putc>
        putc(fd, c0);
    14da:	85a6                	mv	a1,s1
    14dc:	855a                	mv	a0,s6
    14de:	c8dff0ef          	jal	116a <putc>
      state = 0;
    14e2:	4981                	li	s3,0
    14e4:	b359                	j	126a <vprintf+0x44>

00000000000014e6 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    14e6:	715d                	addi	sp,sp,-80
    14e8:	ec06                	sd	ra,24(sp)
    14ea:	e822                	sd	s0,16(sp)
    14ec:	1000                	addi	s0,sp,32
    14ee:	e010                	sd	a2,0(s0)
    14f0:	e414                	sd	a3,8(s0)
    14f2:	e818                	sd	a4,16(s0)
    14f4:	ec1c                	sd	a5,24(s0)
    14f6:	03043023          	sd	a6,32(s0)
    14fa:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    14fe:	8622                	mv	a2,s0
    1500:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    1504:	d23ff0ef          	jal	1226 <vprintf>
}
    1508:	60e2                	ld	ra,24(sp)
    150a:	6442                	ld	s0,16(sp)
    150c:	6161                	addi	sp,sp,80
    150e:	8082                	ret

0000000000001510 <printf>:

void
printf(const char *fmt, ...)
{
    1510:	711d                	addi	sp,sp,-96
    1512:	ec06                	sd	ra,24(sp)
    1514:	e822                	sd	s0,16(sp)
    1516:	1000                	addi	s0,sp,32
    1518:	e40c                	sd	a1,8(s0)
    151a:	e810                	sd	a2,16(s0)
    151c:	ec14                	sd	a3,24(s0)
    151e:	f018                	sd	a4,32(s0)
    1520:	f41c                	sd	a5,40(s0)
    1522:	03043823          	sd	a6,48(s0)
    1526:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    152a:	00840613          	addi	a2,s0,8
    152e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    1532:	85aa                	mv	a1,a0
    1534:	4505                	li	a0,1
    1536:	cf1ff0ef          	jal	1226 <vprintf>
}
    153a:	60e2                	ld	ra,24(sp)
    153c:	6442                	ld	s0,16(sp)
    153e:	6125                	addi	sp,sp,96
    1540:	8082                	ret

0000000000001542 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1542:	1141                	addi	sp,sp,-16
    1544:	e406                	sd	ra,8(sp)
    1546:	e022                	sd	s0,0(sp)
    1548:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    154a:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    154e:	00001797          	auipc	a5,0x1
    1552:	ad27b783          	ld	a5,-1326(a5) # 2020 <freep>
    1556:	a039                	j	1564 <free+0x22>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1558:	6398                	ld	a4,0(a5)
    155a:	00e7e463          	bltu	a5,a4,1562 <free+0x20>
    155e:	00e6ea63          	bltu	a3,a4,1572 <free+0x30>
{
    1562:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1564:	fed7fae3          	bgeu	a5,a3,1558 <free+0x16>
    1568:	6398                	ld	a4,0(a5)
    156a:	00e6e463          	bltu	a3,a4,1572 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    156e:	fee7eae3          	bltu	a5,a4,1562 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1572:	ff852583          	lw	a1,-8(a0)
    1576:	6390                	ld	a2,0(a5)
    1578:	02059813          	slli	a6,a1,0x20
    157c:	01c85713          	srli	a4,a6,0x1c
    1580:	9736                	add	a4,a4,a3
    1582:	02e60563          	beq	a2,a4,15ac <free+0x6a>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1586:	fec53823          	sd	a2,-16(a0)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    158a:	4790                	lw	a2,8(a5)
    158c:	02061593          	slli	a1,a2,0x20
    1590:	01c5d713          	srli	a4,a1,0x1c
    1594:	973e                	add	a4,a4,a5
    1596:	02e68263          	beq	a3,a4,15ba <free+0x78>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    159a:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
    159c:	00001717          	auipc	a4,0x1
    15a0:	a8f73223          	sd	a5,-1404(a4) # 2020 <freep>
}
    15a4:	60a2                	ld	ra,8(sp)
    15a6:	6402                	ld	s0,0(sp)
    15a8:	0141                	addi	sp,sp,16
    15aa:	8082                	ret
    bp->s.size += p->s.ptr->s.size;
    15ac:	4618                	lw	a4,8(a2)
    15ae:	9f2d                	addw	a4,a4,a1
    15b0:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    15b4:	6398                	ld	a4,0(a5)
    15b6:	6310                	ld	a2,0(a4)
    15b8:	b7f9                	j	1586 <free+0x44>
    p->s.size += bp->s.size;
    15ba:	ff852703          	lw	a4,-8(a0)
    15be:	9f31                	addw	a4,a4,a2
    15c0:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    15c2:	ff053683          	ld	a3,-16(a0)
    15c6:	bfd1                	j	159a <free+0x58>

00000000000015c8 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    15c8:	7139                	addi	sp,sp,-64
    15ca:	fc06                	sd	ra,56(sp)
    15cc:	f822                	sd	s0,48(sp)
    15ce:	f04a                	sd	s2,32(sp)
    15d0:	ec4e                	sd	s3,24(sp)
    15d2:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    15d4:	02051993          	slli	s3,a0,0x20
    15d8:	0209d993          	srli	s3,s3,0x20
    15dc:	09bd                	addi	s3,s3,15
    15de:	0049d993          	srli	s3,s3,0x4
    15e2:	2985                	addiw	s3,s3,1
    15e4:	894e                	mv	s2,s3
  if((prevp = freep) == 0){
    15e6:	00001517          	auipc	a0,0x1
    15ea:	a3a53503          	ld	a0,-1478(a0) # 2020 <freep>
    15ee:	c905                	beqz	a0,161e <malloc+0x56>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15f0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    15f2:	4798                	lw	a4,8(a5)
    15f4:	09377663          	bgeu	a4,s3,1680 <malloc+0xb8>
    15f8:	f426                	sd	s1,40(sp)
    15fa:	e852                	sd	s4,16(sp)
    15fc:	e456                	sd	s5,8(sp)
    15fe:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
    1600:	8a4e                	mv	s4,s3
    1602:	6705                	lui	a4,0x1
    1604:	00e9f363          	bgeu	s3,a4,160a <malloc+0x42>
    1608:	6a05                	lui	s4,0x1
    160a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
    160e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1612:	00001497          	auipc	s1,0x1
    1616:	a0e48493          	addi	s1,s1,-1522 # 2020 <freep>
  if(p == SBRK_ERROR)
    161a:	5afd                	li	s5,-1
    161c:	a83d                	j	165a <malloc+0x92>
    161e:	f426                	sd	s1,40(sp)
    1620:	e852                	sd	s4,16(sp)
    1622:	e456                	sd	s5,8(sp)
    1624:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
    1626:	00001797          	auipc	a5,0x1
    162a:	a9278793          	addi	a5,a5,-1390 # 20b8 <base>
    162e:	00001717          	auipc	a4,0x1
    1632:	9ef73923          	sd	a5,-1550(a4) # 2020 <freep>
    1636:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
    1638:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
    163c:	b7d1                	j	1600 <malloc+0x38>
        prevp->s.ptr = p->s.ptr;
    163e:	6398                	ld	a4,0(a5)
    1640:	e118                	sd	a4,0(a0)
    1642:	a899                	j	1698 <malloc+0xd0>
  hp->s.size = nu;
    1644:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    1648:	0541                	addi	a0,a0,16
    164a:	ef9ff0ef          	jal	1542 <free>
  return freep;
    164e:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
    1650:	c125                	beqz	a0,16b0 <malloc+0xe8>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1652:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    1654:	4798                	lw	a4,8(a5)
    1656:	03277163          	bgeu	a4,s2,1678 <malloc+0xb0>
    if(p == freep)
    165a:	6098                	ld	a4,0(s1)
    165c:	853e                	mv	a0,a5
    165e:	fef71ae3          	bne	a4,a5,1652 <malloc+0x8a>
  p = sbrk(nu * sizeof(Header));
    1662:	8552                	mv	a0,s4
    1664:	a33ff0ef          	jal	1096 <sbrk>
  if(p == SBRK_ERROR)
    1668:	fd551ee3          	bne	a0,s5,1644 <malloc+0x7c>
        return 0;
    166c:	4501                	li	a0,0
    166e:	74a2                	ld	s1,40(sp)
    1670:	6a42                	ld	s4,16(sp)
    1672:	6aa2                	ld	s5,8(sp)
    1674:	6b02                	ld	s6,0(sp)
    1676:	a03d                	j	16a4 <malloc+0xdc>
    1678:	74a2                	ld	s1,40(sp)
    167a:	6a42                	ld	s4,16(sp)
    167c:	6aa2                	ld	s5,8(sp)
    167e:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
    1680:	fae90fe3          	beq	s2,a4,163e <malloc+0x76>
        p->s.size -= nunits;
    1684:	4137073b          	subw	a4,a4,s3
    1688:	c798                	sw	a4,8(a5)
        p += p->s.size;
    168a:	02071693          	slli	a3,a4,0x20
    168e:	01c6d713          	srli	a4,a3,0x1c
    1692:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    1694:	0137a423          	sw	s3,8(a5)
      freep = prevp;
    1698:	00001717          	auipc	a4,0x1
    169c:	98a73423          	sd	a0,-1656(a4) # 2020 <freep>
      return (void*)(p + 1);
    16a0:	01078513          	addi	a0,a5,16
  }
}
    16a4:	70e2                	ld	ra,56(sp)
    16a6:	7442                	ld	s0,48(sp)
    16a8:	7902                	ld	s2,32(sp)
    16aa:	69e2                	ld	s3,24(sp)
    16ac:	6121                	addi	sp,sp,64
    16ae:	8082                	ret
    16b0:	74a2                	ld	s1,40(sp)
    16b2:	6a42                	ld	s4,16(sp)
    16b4:	6aa2                	ld	s5,8(sp)
    16b6:	6b02                	ld	s6,0(sp)
    16b8:	b7f5                	j	16a4 <malloc+0xdc>
