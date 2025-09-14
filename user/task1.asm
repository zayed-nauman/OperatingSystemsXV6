
user/_task1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <init_matrices>:
int B[N][N];
int C[N][N];

void
init_matrices(void)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  int i, j;
  // Simple test matrices:
  // A[i][j] = i + 1
  // B[i][j] = j + 1
  for (i = 0; i < N; i++) {
   8:	00001e17          	auipc	t3,0x1
   c:	008e0e13          	addi	t3,t3,8 # 1010 <A>
  10:	00001317          	auipc	t1,0x1
  14:	19030313          	addi	t1,t1,400 # 11a0 <B>
  18:	00001897          	auipc	a7,0x1
  1c:	31888893          	addi	a7,a7,792 # 1330 <C>
    for (j = 0; j < N; j++) {
  20:	4505                	li	a0,1
  22:	4829                	li	a6,10
  for (i = 0; i < N; i++) {
  24:	4ead                	li	t4,11
{
  26:	8646                	mv	a2,a7
  28:	869a                	mv	a3,t1
  2a:	8772                	mv	a4,t3
    for (j = 0; j < N; j++) {
  2c:	4781                	li	a5,0
      A[i][j] = i + 1;
  2e:	c308                	sw	a0,0(a4)
      B[i][j] = j + 1;
  30:	0017859b          	addiw	a1,a5,1
  34:	87ae                	mv	a5,a1
  36:	c28c                	sw	a1,0(a3)
      C[i][j] = 0;
  38:	00062023          	sw	zero,0(a2)
    for (j = 0; j < N; j++) {
  3c:	0711                	addi	a4,a4,4
  3e:	0691                	addi	a3,a3,4
  40:	0611                	addi	a2,a2,4
  42:	ff0596e3          	bne	a1,a6,2e <init_matrices+0x2e>
  for (i = 0; i < N; i++) {
  46:	2505                	addiw	a0,a0,1
  48:	028e0e13          	addi	t3,t3,40
  4c:	02830313          	addi	t1,t1,40
  50:	02888893          	addi	a7,a7,40
  54:	fdd519e3          	bne	a0,t4,26 <init_matrices+0x26>
    }
  }
}
  58:	60a2                	ld	ra,8(sp)
  5a:	6402                	ld	s0,0(sp)
  5c:	0141                	addi	sp,sp,16
  5e:	8082                	ret

0000000000000060 <print_matrix>:

void
print_matrix(char *name, int M[N][N])
{
  60:	7139                	addi	sp,sp,-64
  62:	fc06                	sd	ra,56(sp)
  64:	f822                	sd	s0,48(sp)
  66:	f426                	sd	s1,40(sp)
  68:	f04a                	sd	s2,32(sp)
  6a:	ec4e                	sd	s3,24(sp)
  6c:	e852                	sd	s4,16(sp)
  6e:	e456                	sd	s5,8(sp)
  70:	0080                	addi	s0,sp,64
  72:	8a2e                	mv	s4,a1
  int i, j;
  printf("%s:\n", name);
  74:	85aa                	mv	a1,a0
  76:	00001517          	auipc	a0,0x1
  7a:	a8a50513          	addi	a0,a0,-1398 # b00 <malloc+0xf2>
  7e:	0d9000ef          	jal	956 <printf>
  for (i = 0; i < N; i++) {
  82:	028a0913          	addi	s2,s4,40
  86:	1b8a0a13          	addi	s4,s4,440
    for (j = 0; j < N; j++) {
      printf("%d ", M[i][j]);
  8a:	00001997          	auipc	s3,0x1
  8e:	a8698993          	addi	s3,s3,-1402 # b10 <malloc+0x102>
    }
    printf("\n");
  92:	00001a97          	auipc	s5,0x1
  96:	a86a8a93          	addi	s5,s5,-1402 # b18 <malloc+0x10a>
    for (j = 0; j < N; j++) {
  9a:	fd890493          	addi	s1,s2,-40
      printf("%d ", M[i][j]);
  9e:	408c                	lw	a1,0(s1)
  a0:	854e                	mv	a0,s3
  a2:	0b5000ef          	jal	956 <printf>
    for (j = 0; j < N; j++) {
  a6:	0491                	addi	s1,s1,4
  a8:	ff249be3          	bne	s1,s2,9e <print_matrix+0x3e>
    printf("\n");
  ac:	8556                	mv	a0,s5
  ae:	0a9000ef          	jal	956 <printf>
  for (i = 0; i < N; i++) {
  b2:	02890913          	addi	s2,s2,40
  b6:	ff4912e3          	bne	s2,s4,9a <print_matrix+0x3a>
  }
  printf("\n");
  ba:	00001517          	auipc	a0,0x1
  be:	a5e50513          	addi	a0,a0,-1442 # b18 <malloc+0x10a>
  c2:	095000ef          	jal	956 <printf>
}
  c6:	70e2                	ld	ra,56(sp)
  c8:	7442                	ld	s0,48(sp)
  ca:	74a2                	ld	s1,40(sp)
  cc:	7902                	ld	s2,32(sp)
  ce:	69e2                	ld	s3,24(sp)
  d0:	6a42                	ld	s4,16(sp)
  d2:	6aa2                	ld	s5,8(sp)
  d4:	6121                	addi	sp,sp,64
  d6:	8082                	ret

00000000000000d8 <main>:

int
main(void)
{
  d8:	7119                	addi	sp,sp,-128
  da:	fc86                	sd	ra,120(sp)
  dc:	f8a2                	sd	s0,112(sp)
  de:	f4a6                	sd	s1,104(sp)
  e0:	f0ca                	sd	s2,96(sp)
  e2:	ecce                	sd	s3,88(sp)
  e4:	e8d2                	sd	s4,80(sp)
  e6:	e4d6                	sd	s5,72(sp)
  e8:	e0da                	sd	s6,64(sp)
  ea:	fc5e                	sd	s7,56(sp)
  ec:	0100                	addi	s0,sp,128
  int i, j, k;

  init_matrices();
  ee:	f13ff0ef          	jal	0 <init_matrices>

  // For each row, create a fresh pipe, fork child, child writes row to pipe,
  // parent immediately reads row and waits for child. This keeps only few fds open.
  for (i = 0; i < N; i++) {
  f2:	00001997          	auipc	s3,0x1
  f6:	23e98993          	addi	s3,s3,574 # 1330 <C>
  fa:	4901                	li	s2,0
    int p[2];
    if (pipe(p) < 0) {
  fc:	f8040a93          	addi	s5,s0,-128
      close(p[1]);
      exit(0);
    } else {
      // Parent: read row from pipe and wait for the child
      close(p[1]); // close write end in parent
      int got = read(p[0], (char*)C[i], sizeof(C[i]));
 100:	02800a13          	li	s4,40
      if (got != sizeof(C[i])) {
        printf("parent: read row %d returned %d (expected %d)\n", i, got, (int)sizeof(C[i]));
 104:	00001b97          	auipc	s7,0x1
 108:	a5cb8b93          	addi	s7,s7,-1444 # b60 <malloc+0x152>
  for (i = 0; i < N; i++) {
 10c:	4b29                	li	s6,10
 10e:	a0f9                	j	1dc <main+0x104>
      printf("pipe failed for row %d\n", i);
 110:	85ca                	mv	a1,s2
 112:	00001517          	auipc	a0,0x1
 116:	a0e50513          	addi	a0,a0,-1522 # b20 <malloc+0x112>
 11a:	03d000ef          	jal	956 <printf>
      exit(1);
 11e:	4505                	li	a0,1
 120:	3f0000ef          	jal	510 <exit>
      printf("fork failed\n");
 124:	00001517          	auipc	a0,0x1
 128:	a1450513          	addi	a0,a0,-1516 # b38 <malloc+0x12a>
 12c:	02b000ef          	jal	956 <printf>
      exit(1);
 130:	4505                	li	a0,1
 132:	3de000ef          	jal	510 <exit>
      close(p[0]); // close read end in child
 136:	f8042503          	lw	a0,-128(s0)
 13a:	3fe000ef          	jal	538 <close>
      for (j = 0; j < N; j++) {
 13e:	f8840813          	addi	a6,s0,-120
 142:	00001517          	auipc	a0,0x1
 146:	1ee50513          	addi	a0,a0,494 # 1330 <C>
 14a:	00001317          	auipc	t1,0x1
 14e:	20e30313          	addi	t1,t1,526 # 1358 <C+0x28>
 152:	02800793          	li	a5,40
 156:	02f907b3          	mul	a5,s2,a5
 15a:	00001897          	auipc	a7,0x1
 15e:	eb688893          	addi	a7,a7,-330 # 1010 <A>
 162:	98be                	add	a7,a7,a5
        for (k = 0; k < N; k++) {
 164:	e7050713          	addi	a4,a0,-400
  for (i = 0; i < N; i++) {
 168:	86c6                	mv	a3,a7
        int sum = 0;
 16a:	8626                	mv	a2,s1
          sum += A[i][k] * B[k][j];
 16c:	428c                	lw	a1,0(a3)
 16e:	431c                	lw	a5,0(a4)
 170:	02b787bb          	mulw	a5,a5,a1
 174:	9fb1                	addw	a5,a5,a2
 176:	863e                	mv	a2,a5
        for (k = 0; k < N; k++) {
 178:	0691                	addi	a3,a3,4
 17a:	02870713          	addi	a4,a4,40
 17e:	fea717e3          	bne	a4,a0,16c <main+0x94>
        row[j] = sum;
 182:	00f82023          	sw	a5,0(a6)
      for (j = 0; j < N; j++) {
 186:	0811                	addi	a6,a6,4
 188:	0511                	addi	a0,a0,4
 18a:	fc651de3          	bne	a0,t1,164 <main+0x8c>
      if (write(p[1], (char*)row, sizeof(row)) != sizeof(row)) {
 18e:	02800613          	li	a2,40
 192:	f8840593          	addi	a1,s0,-120
 196:	f8442503          	lw	a0,-124(s0)
 19a:	396000ef          	jal	530 <write>
 19e:	02800793          	li	a5,40
 1a2:	00f51963          	bne	a0,a5,1b4 <main+0xdc>
      close(p[1]);
 1a6:	f8442503          	lw	a0,-124(s0)
 1aa:	38e000ef          	jal	538 <close>
      exit(0);
 1ae:	4501                	li	a0,0
 1b0:	360000ef          	jal	510 <exit>
        printf("child %d: write error\n", i);
 1b4:	85ca                	mv	a1,s2
 1b6:	00001517          	auipc	a0,0x1
 1ba:	99250513          	addi	a0,a0,-1646 # b48 <malloc+0x13a>
 1be:	798000ef          	jal	956 <printf>
 1c2:	b7d5                	j	1a6 <main+0xce>
      }
      close(p[0]);
 1c4:	f8042503          	lw	a0,-128(s0)
 1c8:	370000ef          	jal	538 <close>
      wait(0);
 1cc:	4501                	li	a0,0
 1ce:	34a000ef          	jal	518 <wait>
  for (i = 0; i < N; i++) {
 1d2:	2905                	addiw	s2,s2,1
 1d4:	02898993          	addi	s3,s3,40
 1d8:	05690063          	beq	s2,s6,218 <main+0x140>
    if (pipe(p) < 0) {
 1dc:	8556                	mv	a0,s5
 1de:	342000ef          	jal	520 <pipe>
 1e2:	f20547e3          	bltz	a0,110 <main+0x38>
    int pid = fork();
 1e6:	322000ef          	jal	508 <fork>
 1ea:	84aa                	mv	s1,a0
    if (pid < 0) {
 1ec:	f2054ce3          	bltz	a0,124 <main+0x4c>
    if (pid == 0) {
 1f0:	d139                	beqz	a0,136 <main+0x5e>
      close(p[1]); // close write end in parent
 1f2:	f8442503          	lw	a0,-124(s0)
 1f6:	342000ef          	jal	538 <close>
      int got = read(p[0], (char*)C[i], sizeof(C[i]));
 1fa:	8652                	mv	a2,s4
 1fc:	85ce                	mv	a1,s3
 1fe:	f8042503          	lw	a0,-128(s0)
 202:	326000ef          	jal	528 <read>
      if (got != sizeof(C[i])) {
 206:	fb450fe3          	beq	a0,s4,1c4 <main+0xec>
        printf("parent: read row %d returned %d (expected %d)\n", i, got, (int)sizeof(C[i]));
 20a:	86d2                	mv	a3,s4
 20c:	862a                	mv	a2,a0
 20e:	85ca                	mv	a1,s2
 210:	855e                	mv	a0,s7
 212:	744000ef          	jal	956 <printf>
 216:	b77d                	j	1c4 <main+0xec>
    }
  }

  // Print matrices
  print_matrix("Matrix A", A);
 218:	00001597          	auipc	a1,0x1
 21c:	df858593          	addi	a1,a1,-520 # 1010 <A>
 220:	00001517          	auipc	a0,0x1
 224:	97050513          	addi	a0,a0,-1680 # b90 <malloc+0x182>
 228:	e39ff0ef          	jal	60 <print_matrix>
  print_matrix("Matrix B", B);
 22c:	00001597          	auipc	a1,0x1
 230:	f7458593          	addi	a1,a1,-140 # 11a0 <B>
 234:	00001517          	auipc	a0,0x1
 238:	96c50513          	addi	a0,a0,-1684 # ba0 <malloc+0x192>
 23c:	e25ff0ef          	jal	60 <print_matrix>
  print_matrix("Matrix C = A * B", C);
 240:	00001597          	auipc	a1,0x1
 244:	0f058593          	addi	a1,a1,240 # 1330 <C>
 248:	00001517          	auipc	a0,0x1
 24c:	96850513          	addi	a0,a0,-1688 # bb0 <malloc+0x1a2>
 250:	e11ff0ef          	jal	60 <print_matrix>

  exit(0);
 254:	4501                	li	a0,0
 256:	2ba000ef          	jal	510 <exit>

000000000000025a <start>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
start(int argc, char **argv)
{
 25a:	1141                	addi	sp,sp,-16
 25c:	e406                	sd	ra,8(sp)
 25e:	e022                	sd	s0,0(sp)
 260:	0800                	addi	s0,sp,16
  int r;
  extern int main(int argc, char **argv);
  r = main(argc, argv);
 262:	e77ff0ef          	jal	d8 <main>
  exit(r);
 266:	2aa000ef          	jal	510 <exit>

000000000000026a <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e406                	sd	ra,8(sp)
 26e:	e022                	sd	s0,0(sp)
 270:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 272:	87aa                	mv	a5,a0
 274:	0585                	addi	a1,a1,1
 276:	0785                	addi	a5,a5,1
 278:	fff5c703          	lbu	a4,-1(a1)
 27c:	fee78fa3          	sb	a4,-1(a5)
 280:	fb75                	bnez	a4,274 <strcpy+0xa>
    ;
  return os;
}
 282:	60a2                	ld	ra,8(sp)
 284:	6402                	ld	s0,0(sp)
 286:	0141                	addi	sp,sp,16
 288:	8082                	ret

000000000000028a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 28a:	1141                	addi	sp,sp,-16
 28c:	e406                	sd	ra,8(sp)
 28e:	e022                	sd	s0,0(sp)
 290:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 292:	00054783          	lbu	a5,0(a0)
 296:	cb91                	beqz	a5,2aa <strcmp+0x20>
 298:	0005c703          	lbu	a4,0(a1)
 29c:	00f71763          	bne	a4,a5,2aa <strcmp+0x20>
    p++, q++;
 2a0:	0505                	addi	a0,a0,1
 2a2:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2a4:	00054783          	lbu	a5,0(a0)
 2a8:	fbe5                	bnez	a5,298 <strcmp+0xe>
  return (uchar)*p - (uchar)*q;
 2aa:	0005c503          	lbu	a0,0(a1)
}
 2ae:	40a7853b          	subw	a0,a5,a0
 2b2:	60a2                	ld	ra,8(sp)
 2b4:	6402                	ld	s0,0(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret

00000000000002ba <strlen>:

uint
strlen(const char *s)
{
 2ba:	1141                	addi	sp,sp,-16
 2bc:	e406                	sd	ra,8(sp)
 2be:	e022                	sd	s0,0(sp)
 2c0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 2c2:	00054783          	lbu	a5,0(a0)
 2c6:	cf91                	beqz	a5,2e2 <strlen+0x28>
 2c8:	00150793          	addi	a5,a0,1
 2cc:	86be                	mv	a3,a5
 2ce:	0785                	addi	a5,a5,1
 2d0:	fff7c703          	lbu	a4,-1(a5)
 2d4:	ff65                	bnez	a4,2cc <strlen+0x12>
 2d6:	40a6853b          	subw	a0,a3,a0
    ;
  return n;
}
 2da:	60a2                	ld	ra,8(sp)
 2dc:	6402                	ld	s0,0(sp)
 2de:	0141                	addi	sp,sp,16
 2e0:	8082                	ret
  for(n = 0; s[n]; n++)
 2e2:	4501                	li	a0,0
 2e4:	bfdd                	j	2da <strlen+0x20>

00000000000002e6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2e6:	1141                	addi	sp,sp,-16
 2e8:	e406                	sd	ra,8(sp)
 2ea:	e022                	sd	s0,0(sp)
 2ec:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2ee:	ca19                	beqz	a2,304 <memset+0x1e>
 2f0:	87aa                	mv	a5,a0
 2f2:	1602                	slli	a2,a2,0x20
 2f4:	9201                	srli	a2,a2,0x20
 2f6:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2fa:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2fe:	0785                	addi	a5,a5,1
 300:	fee79de3          	bne	a5,a4,2fa <memset+0x14>
  }
  return dst;
}
 304:	60a2                	ld	ra,8(sp)
 306:	6402                	ld	s0,0(sp)
 308:	0141                	addi	sp,sp,16
 30a:	8082                	ret

000000000000030c <strchr>:

char*
strchr(const char *s, char c)
{
 30c:	1141                	addi	sp,sp,-16
 30e:	e406                	sd	ra,8(sp)
 310:	e022                	sd	s0,0(sp)
 312:	0800                	addi	s0,sp,16
  for(; *s; s++)
 314:	00054783          	lbu	a5,0(a0)
 318:	cf81                	beqz	a5,330 <strchr+0x24>
    if(*s == c)
 31a:	00f58763          	beq	a1,a5,328 <strchr+0x1c>
  for(; *s; s++)
 31e:	0505                	addi	a0,a0,1
 320:	00054783          	lbu	a5,0(a0)
 324:	fbfd                	bnez	a5,31a <strchr+0xe>
      return (char*)s;
  return 0;
 326:	4501                	li	a0,0
}
 328:	60a2                	ld	ra,8(sp)
 32a:	6402                	ld	s0,0(sp)
 32c:	0141                	addi	sp,sp,16
 32e:	8082                	ret
  return 0;
 330:	4501                	li	a0,0
 332:	bfdd                	j	328 <strchr+0x1c>

0000000000000334 <gets>:

char*
gets(char *buf, int max)
{
 334:	711d                	addi	sp,sp,-96
 336:	ec86                	sd	ra,88(sp)
 338:	e8a2                	sd	s0,80(sp)
 33a:	e4a6                	sd	s1,72(sp)
 33c:	e0ca                	sd	s2,64(sp)
 33e:	fc4e                	sd	s3,56(sp)
 340:	f852                	sd	s4,48(sp)
 342:	f456                	sd	s5,40(sp)
 344:	f05a                	sd	s6,32(sp)
 346:	ec5e                	sd	s7,24(sp)
 348:	e862                	sd	s8,16(sp)
 34a:	1080                	addi	s0,sp,96
 34c:	8baa                	mv	s7,a0
 34e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 350:	892a                	mv	s2,a0
 352:	4481                	li	s1,0
    cc = read(0, &c, 1);
 354:	faf40b13          	addi	s6,s0,-81
 358:	4a85                	li	s5,1
  for(i=0; i+1 < max; ){
 35a:	8c26                	mv	s8,s1
 35c:	0014899b          	addiw	s3,s1,1
 360:	84ce                	mv	s1,s3
 362:	0349d463          	bge	s3,s4,38a <gets+0x56>
    cc = read(0, &c, 1);
 366:	8656                	mv	a2,s5
 368:	85da                	mv	a1,s6
 36a:	4501                	li	a0,0
 36c:	1bc000ef          	jal	528 <read>
    if(cc < 1)
 370:	00a05d63          	blez	a0,38a <gets+0x56>
      break;
    buf[i++] = c;
 374:	faf44783          	lbu	a5,-81(s0)
 378:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 37c:	0905                	addi	s2,s2,1
 37e:	ff678713          	addi	a4,a5,-10
 382:	c319                	beqz	a4,388 <gets+0x54>
 384:	17cd                	addi	a5,a5,-13
 386:	fbf1                	bnez	a5,35a <gets+0x26>
    buf[i++] = c;
 388:	8c4e                	mv	s8,s3
      break;
  }
  buf[i] = '\0';
 38a:	9c5e                	add	s8,s8,s7
 38c:	000c0023          	sb	zero,0(s8)
  return buf;
}
 390:	855e                	mv	a0,s7
 392:	60e6                	ld	ra,88(sp)
 394:	6446                	ld	s0,80(sp)
 396:	64a6                	ld	s1,72(sp)
 398:	6906                	ld	s2,64(sp)
 39a:	79e2                	ld	s3,56(sp)
 39c:	7a42                	ld	s4,48(sp)
 39e:	7aa2                	ld	s5,40(sp)
 3a0:	7b02                	ld	s6,32(sp)
 3a2:	6be2                	ld	s7,24(sp)
 3a4:	6c42                	ld	s8,16(sp)
 3a6:	6125                	addi	sp,sp,96
 3a8:	8082                	ret

00000000000003aa <stat>:

int
stat(const char *n, struct stat *st)
{
 3aa:	1101                	addi	sp,sp,-32
 3ac:	ec06                	sd	ra,24(sp)
 3ae:	e822                	sd	s0,16(sp)
 3b0:	e04a                	sd	s2,0(sp)
 3b2:	1000                	addi	s0,sp,32
 3b4:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b6:	4581                	li	a1,0
 3b8:	198000ef          	jal	550 <open>
  if(fd < 0)
 3bc:	02054263          	bltz	a0,3e0 <stat+0x36>
 3c0:	e426                	sd	s1,8(sp)
 3c2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 3c4:	85ca                	mv	a1,s2
 3c6:	1a2000ef          	jal	568 <fstat>
 3ca:	892a                	mv	s2,a0
  close(fd);
 3cc:	8526                	mv	a0,s1
 3ce:	16a000ef          	jal	538 <close>
  return r;
 3d2:	64a2                	ld	s1,8(sp)
}
 3d4:	854a                	mv	a0,s2
 3d6:	60e2                	ld	ra,24(sp)
 3d8:	6442                	ld	s0,16(sp)
 3da:	6902                	ld	s2,0(sp)
 3dc:	6105                	addi	sp,sp,32
 3de:	8082                	ret
    return -1;
 3e0:	57fd                	li	a5,-1
 3e2:	893e                	mv	s2,a5
 3e4:	bfc5                	j	3d4 <stat+0x2a>

00000000000003e6 <atoi>:

int
atoi(const char *s)
{
 3e6:	1141                	addi	sp,sp,-16
 3e8:	e406                	sd	ra,8(sp)
 3ea:	e022                	sd	s0,0(sp)
 3ec:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ee:	00054683          	lbu	a3,0(a0)
 3f2:	fd06879b          	addiw	a5,a3,-48
 3f6:	0ff7f793          	zext.b	a5,a5
 3fa:	4625                	li	a2,9
 3fc:	02f66963          	bltu	a2,a5,42e <atoi+0x48>
 400:	872a                	mv	a4,a0
  n = 0;
 402:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 404:	0705                	addi	a4,a4,1
 406:	0025179b          	slliw	a5,a0,0x2
 40a:	9fa9                	addw	a5,a5,a0
 40c:	0017979b          	slliw	a5,a5,0x1
 410:	9fb5                	addw	a5,a5,a3
 412:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 416:	00074683          	lbu	a3,0(a4)
 41a:	fd06879b          	addiw	a5,a3,-48
 41e:	0ff7f793          	zext.b	a5,a5
 422:	fef671e3          	bgeu	a2,a5,404 <atoi+0x1e>
  return n;
}
 426:	60a2                	ld	ra,8(sp)
 428:	6402                	ld	s0,0(sp)
 42a:	0141                	addi	sp,sp,16
 42c:	8082                	ret
  n = 0;
 42e:	4501                	li	a0,0
 430:	bfdd                	j	426 <atoi+0x40>

0000000000000432 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 432:	1141                	addi	sp,sp,-16
 434:	e406                	sd	ra,8(sp)
 436:	e022                	sd	s0,0(sp)
 438:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 43a:	02b57563          	bgeu	a0,a1,464 <memmove+0x32>
    while(n-- > 0)
 43e:	00c05f63          	blez	a2,45c <memmove+0x2a>
 442:	1602                	slli	a2,a2,0x20
 444:	9201                	srli	a2,a2,0x20
 446:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 44a:	872a                	mv	a4,a0
      *dst++ = *src++;
 44c:	0585                	addi	a1,a1,1
 44e:	0705                	addi	a4,a4,1
 450:	fff5c683          	lbu	a3,-1(a1)
 454:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 458:	fee79ae3          	bne	a5,a4,44c <memmove+0x1a>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 45c:	60a2                	ld	ra,8(sp)
 45e:	6402                	ld	s0,0(sp)
 460:	0141                	addi	sp,sp,16
 462:	8082                	ret
    while(n-- > 0)
 464:	fec05ce3          	blez	a2,45c <memmove+0x2a>
    dst += n;
 468:	00c50733          	add	a4,a0,a2
    src += n;
 46c:	95b2                	add	a1,a1,a2
 46e:	fff6079b          	addiw	a5,a2,-1
 472:	1782                	slli	a5,a5,0x20
 474:	9381                	srli	a5,a5,0x20
 476:	fff7c793          	not	a5,a5
 47a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 47c:	15fd                	addi	a1,a1,-1
 47e:	177d                	addi	a4,a4,-1
 480:	0005c683          	lbu	a3,0(a1)
 484:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 488:	fef71ae3          	bne	a4,a5,47c <memmove+0x4a>
 48c:	bfc1                	j	45c <memmove+0x2a>

000000000000048e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 48e:	1141                	addi	sp,sp,-16
 490:	e406                	sd	ra,8(sp)
 492:	e022                	sd	s0,0(sp)
 494:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 496:	c61d                	beqz	a2,4c4 <memcmp+0x36>
 498:	1602                	slli	a2,a2,0x20
 49a:	9201                	srli	a2,a2,0x20
 49c:	00c506b3          	add	a3,a0,a2
    if (*p1 != *p2) {
 4a0:	00054783          	lbu	a5,0(a0)
 4a4:	0005c703          	lbu	a4,0(a1)
 4a8:	00e79863          	bne	a5,a4,4b8 <memcmp+0x2a>
      return *p1 - *p2;
    }
    p1++;
 4ac:	0505                	addi	a0,a0,1
    p2++;
 4ae:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4b0:	fed518e3          	bne	a0,a3,4a0 <memcmp+0x12>
  }
  return 0;
 4b4:	4501                	li	a0,0
 4b6:	a019                	j	4bc <memcmp+0x2e>
      return *p1 - *p2;
 4b8:	40e7853b          	subw	a0,a5,a4
}
 4bc:	60a2                	ld	ra,8(sp)
 4be:	6402                	ld	s0,0(sp)
 4c0:	0141                	addi	sp,sp,16
 4c2:	8082                	ret
  return 0;
 4c4:	4501                	li	a0,0
 4c6:	bfdd                	j	4bc <memcmp+0x2e>

00000000000004c8 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 4c8:	1141                	addi	sp,sp,-16
 4ca:	e406                	sd	ra,8(sp)
 4cc:	e022                	sd	s0,0(sp)
 4ce:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 4d0:	f63ff0ef          	jal	432 <memmove>
}
 4d4:	60a2                	ld	ra,8(sp)
 4d6:	6402                	ld	s0,0(sp)
 4d8:	0141                	addi	sp,sp,16
 4da:	8082                	ret

00000000000004dc <sbrk>:

char *
sbrk(int n) {
 4dc:	1141                	addi	sp,sp,-16
 4de:	e406                	sd	ra,8(sp)
 4e0:	e022                	sd	s0,0(sp)
 4e2:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_EAGER);
 4e4:	4585                	li	a1,1
 4e6:	0b2000ef          	jal	598 <sys_sbrk>
}
 4ea:	60a2                	ld	ra,8(sp)
 4ec:	6402                	ld	s0,0(sp)
 4ee:	0141                	addi	sp,sp,16
 4f0:	8082                	ret

00000000000004f2 <sbrklazy>:

char *
sbrklazy(int n) {
 4f2:	1141                	addi	sp,sp,-16
 4f4:	e406                	sd	ra,8(sp)
 4f6:	e022                	sd	s0,0(sp)
 4f8:	0800                	addi	s0,sp,16
  return sys_sbrk(n, SBRK_LAZY);
 4fa:	4589                	li	a1,2
 4fc:	09c000ef          	jal	598 <sys_sbrk>
}
 500:	60a2                	ld	ra,8(sp)
 502:	6402                	ld	s0,0(sp)
 504:	0141                	addi	sp,sp,16
 506:	8082                	ret

0000000000000508 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 508:	4885                	li	a7,1
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <exit>:
.global exit
exit:
 li a7, SYS_exit
 510:	4889                	li	a7,2
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <wait>:
.global wait
wait:
 li a7, SYS_wait
 518:	488d                	li	a7,3
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 520:	4891                	li	a7,4
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <read>:
.global read
read:
 li a7, SYS_read
 528:	4895                	li	a7,5
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <write>:
.global write
write:
 li a7, SYS_write
 530:	48c1                	li	a7,16
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <close>:
.global close
close:
 li a7, SYS_close
 538:	48d5                	li	a7,21
 ecall
 53a:	00000073          	ecall
 ret
 53e:	8082                	ret

0000000000000540 <kill>:
.global kill
kill:
 li a7, SYS_kill
 540:	4899                	li	a7,6
 ecall
 542:	00000073          	ecall
 ret
 546:	8082                	ret

0000000000000548 <exec>:
.global exec
exec:
 li a7, SYS_exec
 548:	489d                	li	a7,7
 ecall
 54a:	00000073          	ecall
 ret
 54e:	8082                	ret

0000000000000550 <open>:
.global open
open:
 li a7, SYS_open
 550:	48bd                	li	a7,15
 ecall
 552:	00000073          	ecall
 ret
 556:	8082                	ret

0000000000000558 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 558:	48c5                	li	a7,17
 ecall
 55a:	00000073          	ecall
 ret
 55e:	8082                	ret

0000000000000560 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 560:	48c9                	li	a7,18
 ecall
 562:	00000073          	ecall
 ret
 566:	8082                	ret

0000000000000568 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 568:	48a1                	li	a7,8
 ecall
 56a:	00000073          	ecall
 ret
 56e:	8082                	ret

0000000000000570 <link>:
.global link
link:
 li a7, SYS_link
 570:	48cd                	li	a7,19
 ecall
 572:	00000073          	ecall
 ret
 576:	8082                	ret

0000000000000578 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 578:	48d1                	li	a7,20
 ecall
 57a:	00000073          	ecall
 ret
 57e:	8082                	ret

0000000000000580 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 580:	48a5                	li	a7,9
 ecall
 582:	00000073          	ecall
 ret
 586:	8082                	ret

0000000000000588 <dup>:
.global dup
dup:
 li a7, SYS_dup
 588:	48a9                	li	a7,10
 ecall
 58a:	00000073          	ecall
 ret
 58e:	8082                	ret

0000000000000590 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 590:	48ad                	li	a7,11
 ecall
 592:	00000073          	ecall
 ret
 596:	8082                	ret

0000000000000598 <sys_sbrk>:
.global sys_sbrk
sys_sbrk:
 li a7, SYS_sbrk
 598:	48b1                	li	a7,12
 ecall
 59a:	00000073          	ecall
 ret
 59e:	8082                	ret

00000000000005a0 <pause>:
.global pause
pause:
 li a7, SYS_pause
 5a0:	48b5                	li	a7,13
 ecall
 5a2:	00000073          	ecall
 ret
 5a6:	8082                	ret

00000000000005a8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5a8:	48b9                	li	a7,14
 ecall
 5aa:	00000073          	ecall
 ret
 5ae:	8082                	ret

00000000000005b0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5b0:	1101                	addi	sp,sp,-32
 5b2:	ec06                	sd	ra,24(sp)
 5b4:	e822                	sd	s0,16(sp)
 5b6:	1000                	addi	s0,sp,32
 5b8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5bc:	4605                	li	a2,1
 5be:	fef40593          	addi	a1,s0,-17
 5c2:	f6fff0ef          	jal	530 <write>
}
 5c6:	60e2                	ld	ra,24(sp)
 5c8:	6442                	ld	s0,16(sp)
 5ca:	6105                	addi	sp,sp,32
 5cc:	8082                	ret

00000000000005ce <printint>:

static void
printint(int fd, long long xx, int base, int sgn)
{
 5ce:	715d                	addi	sp,sp,-80
 5d0:	e486                	sd	ra,72(sp)
 5d2:	e0a2                	sd	s0,64(sp)
 5d4:	f84a                	sd	s2,48(sp)
 5d6:	f44e                	sd	s3,40(sp)
 5d8:	0880                	addi	s0,sp,80
 5da:	892a                	mv	s2,a0
  char buf[20];
  int i, neg;
  unsigned long long x;

  neg = 0;
  if(sgn && xx < 0){
 5dc:	c6d1                	beqz	a3,668 <printint+0x9a>
 5de:	0805d563          	bgez	a1,668 <printint+0x9a>
    neg = 1;
    x = -xx;
 5e2:	40b005b3          	neg	a1,a1
    neg = 1;
 5e6:	4305                	li	t1,1
  } else {
    x = xx;
  }

  i = 0;
 5e8:	fb840993          	addi	s3,s0,-72
  neg = 0;
 5ec:	86ce                	mv	a3,s3
  i = 0;
 5ee:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5f0:	00000817          	auipc	a6,0x0
 5f4:	5e080813          	addi	a6,a6,1504 # bd0 <digits>
 5f8:	88ba                	mv	a7,a4
 5fa:	0017051b          	addiw	a0,a4,1
 5fe:	872a                	mv	a4,a0
 600:	02c5f7b3          	remu	a5,a1,a2
 604:	97c2                	add	a5,a5,a6
 606:	0007c783          	lbu	a5,0(a5)
 60a:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 60e:	87ae                	mv	a5,a1
 610:	02c5d5b3          	divu	a1,a1,a2
 614:	0685                	addi	a3,a3,1
 616:	fec7f1e3          	bgeu	a5,a2,5f8 <printint+0x2a>
  if(neg)
 61a:	00030c63          	beqz	t1,632 <printint+0x64>
    buf[i++] = '-';
 61e:	fd050793          	addi	a5,a0,-48
 622:	00878533          	add	a0,a5,s0
 626:	02d00793          	li	a5,45
 62a:	fef50423          	sb	a5,-24(a0)
 62e:	0028871b          	addiw	a4,a7,2

  while(--i >= 0)
 632:	02e05563          	blez	a4,65c <printint+0x8e>
 636:	fc26                	sd	s1,56(sp)
 638:	377d                	addiw	a4,a4,-1
 63a:	00e984b3          	add	s1,s3,a4
 63e:	19fd                	addi	s3,s3,-1
 640:	99ba                	add	s3,s3,a4
 642:	1702                	slli	a4,a4,0x20
 644:	9301                	srli	a4,a4,0x20
 646:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 64a:	0004c583          	lbu	a1,0(s1)
 64e:	854a                	mv	a0,s2
 650:	f61ff0ef          	jal	5b0 <putc>
  while(--i >= 0)
 654:	14fd                	addi	s1,s1,-1
 656:	ff349ae3          	bne	s1,s3,64a <printint+0x7c>
 65a:	74e2                	ld	s1,56(sp)
}
 65c:	60a6                	ld	ra,72(sp)
 65e:	6406                	ld	s0,64(sp)
 660:	7942                	ld	s2,48(sp)
 662:	79a2                	ld	s3,40(sp)
 664:	6161                	addi	sp,sp,80
 666:	8082                	ret
  neg = 0;
 668:	4301                	li	t1,0
 66a:	bfbd                	j	5e8 <printint+0x1a>

000000000000066c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %c, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 66c:	711d                	addi	sp,sp,-96
 66e:	ec86                	sd	ra,88(sp)
 670:	e8a2                	sd	s0,80(sp)
 672:	e4a6                	sd	s1,72(sp)
 674:	1080                	addi	s0,sp,96
  char *s;
  int c0, c1, c2, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 676:	0005c483          	lbu	s1,0(a1)
 67a:	22048363          	beqz	s1,8a0 <vprintf+0x234>
 67e:	e0ca                	sd	s2,64(sp)
 680:	fc4e                	sd	s3,56(sp)
 682:	f852                	sd	s4,48(sp)
 684:	f456                	sd	s5,40(sp)
 686:	f05a                	sd	s6,32(sp)
 688:	ec5e                	sd	s7,24(sp)
 68a:	e862                	sd	s8,16(sp)
 68c:	8b2a                	mv	s6,a0
 68e:	8a2e                	mv	s4,a1
 690:	8bb2                	mv	s7,a2
  state = 0;
 692:	4981                	li	s3,0
  for(i = 0; fmt[i]; i++){
 694:	4901                	li	s2,0
 696:	4701                	li	a4,0
      if(c0 == '%'){
        state = '%';
      } else {
        putc(fd, c0);
      }
    } else if(state == '%'){
 698:	02500a93          	li	s5,37
      c1 = c2 = 0;
      if(c0) c1 = fmt[i+1] & 0xff;
      if(c1) c2 = fmt[i+2] & 0xff;
      if(c0 == 'd'){
 69c:	06400c13          	li	s8,100
 6a0:	a00d                	j	6c2 <vprintf+0x56>
        putc(fd, c0);
 6a2:	85a6                	mv	a1,s1
 6a4:	855a                	mv	a0,s6
 6a6:	f0bff0ef          	jal	5b0 <putc>
 6aa:	a019                	j	6b0 <vprintf+0x44>
    } else if(state == '%'){
 6ac:	03598363          	beq	s3,s5,6d2 <vprintf+0x66>
  for(i = 0; fmt[i]; i++){
 6b0:	0019079b          	addiw	a5,s2,1
 6b4:	893e                	mv	s2,a5
 6b6:	873e                	mv	a4,a5
 6b8:	97d2                	add	a5,a5,s4
 6ba:	0007c483          	lbu	s1,0(a5)
 6be:	1c048a63          	beqz	s1,892 <vprintf+0x226>
    c0 = fmt[i] & 0xff;
 6c2:	0004879b          	sext.w	a5,s1
    if(state == 0){
 6c6:	fe0993e3          	bnez	s3,6ac <vprintf+0x40>
      if(c0 == '%'){
 6ca:	fd579ce3          	bne	a5,s5,6a2 <vprintf+0x36>
        state = '%';
 6ce:	89be                	mv	s3,a5
 6d0:	b7c5                	j	6b0 <vprintf+0x44>
      if(c0) c1 = fmt[i+1] & 0xff;
 6d2:	00ea06b3          	add	a3,s4,a4
 6d6:	0016c603          	lbu	a2,1(a3)
      if(c1) c2 = fmt[i+2] & 0xff;
 6da:	1c060863          	beqz	a2,8aa <vprintf+0x23e>
      if(c0 == 'd'){
 6de:	03878763          	beq	a5,s8,70c <vprintf+0xa0>
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c0 == 'l' && c1 == 'd'){
 6e2:	f9478693          	addi	a3,a5,-108
 6e6:	0016b693          	seqz	a3,a3
 6ea:	f9c60593          	addi	a1,a2,-100
 6ee:	e99d                	bnez	a1,724 <vprintf+0xb8>
 6f0:	ca95                	beqz	a3,724 <vprintf+0xb8>
        printint(fd, va_arg(ap, uint64), 10, 1);
 6f2:	008b8493          	addi	s1,s7,8
 6f6:	4685                	li	a3,1
 6f8:	4629                	li	a2,10
 6fa:	000bb583          	ld	a1,0(s7)
 6fe:	855a                	mv	a0,s6
 700:	ecfff0ef          	jal	5ce <printint>
        i += 1;
 704:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 1);
 706:	8ba6                	mv	s7,s1
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c0);
      }

      state = 0;
 708:	4981                	li	s3,0
 70a:	b75d                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, int), 10, 1);
 70c:	008b8493          	addi	s1,s7,8
 710:	4685                	li	a3,1
 712:	4629                	li	a2,10
 714:	000ba583          	lw	a1,0(s7)
 718:	855a                	mv	a0,s6
 71a:	eb5ff0ef          	jal	5ce <printint>
 71e:	8ba6                	mv	s7,s1
      state = 0;
 720:	4981                	li	s3,0
 722:	b779                	j	6b0 <vprintf+0x44>
      if(c1) c2 = fmt[i+2] & 0xff;
 724:	9752                	add	a4,a4,s4
 726:	00274583          	lbu	a1,2(a4)
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 72a:	f9460713          	addi	a4,a2,-108
 72e:	00173713          	seqz	a4,a4
 732:	8f75                	and	a4,a4,a3
 734:	f9c58513          	addi	a0,a1,-100
 738:	18051363          	bnez	a0,8be <vprintf+0x252>
 73c:	18070163          	beqz	a4,8be <vprintf+0x252>
        printint(fd, va_arg(ap, uint64), 10, 1);
 740:	008b8493          	addi	s1,s7,8
 744:	4685                	li	a3,1
 746:	4629                	li	a2,10
 748:	000bb583          	ld	a1,0(s7)
 74c:	855a                	mv	a0,s6
 74e:	e81ff0ef          	jal	5ce <printint>
        i += 2;
 752:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 1);
 754:	8ba6                	mv	s7,s1
      state = 0;
 756:	4981                	li	s3,0
        i += 2;
 758:	bfa1                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 10, 0);
 75a:	008b8493          	addi	s1,s7,8
 75e:	4681                	li	a3,0
 760:	4629                	li	a2,10
 762:	000be583          	lwu	a1,0(s7)
 766:	855a                	mv	a0,s6
 768:	e67ff0ef          	jal	5ce <printint>
 76c:	8ba6                	mv	s7,s1
      state = 0;
 76e:	4981                	li	s3,0
 770:	b781                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 772:	008b8493          	addi	s1,s7,8
 776:	4681                	li	a3,0
 778:	4629                	li	a2,10
 77a:	000bb583          	ld	a1,0(s7)
 77e:	855a                	mv	a0,s6
 780:	e4fff0ef          	jal	5ce <printint>
        i += 1;
 784:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 10, 0);
 786:	8ba6                	mv	s7,s1
      state = 0;
 788:	4981                	li	s3,0
 78a:	b71d                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 10, 0);
 78c:	008b8493          	addi	s1,s7,8
 790:	4681                	li	a3,0
 792:	4629                	li	a2,10
 794:	000bb583          	ld	a1,0(s7)
 798:	855a                	mv	a0,s6
 79a:	e35ff0ef          	jal	5ce <printint>
        i += 2;
 79e:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 10, 0);
 7a0:	8ba6                	mv	s7,s1
      state = 0;
 7a2:	4981                	li	s3,0
        i += 2;
 7a4:	b731                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint32), 16, 0);
 7a6:	008b8493          	addi	s1,s7,8
 7aa:	4681                	li	a3,0
 7ac:	4641                	li	a2,16
 7ae:	000be583          	lwu	a1,0(s7)
 7b2:	855a                	mv	a0,s6
 7b4:	e1bff0ef          	jal	5ce <printint>
 7b8:	8ba6                	mv	s7,s1
      state = 0;
 7ba:	4981                	li	s3,0
 7bc:	bdd5                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7be:	008b8493          	addi	s1,s7,8
 7c2:	4681                	li	a3,0
 7c4:	4641                	li	a2,16
 7c6:	000bb583          	ld	a1,0(s7)
 7ca:	855a                	mv	a0,s6
 7cc:	e03ff0ef          	jal	5ce <printint>
        i += 1;
 7d0:	2905                	addiw	s2,s2,1
        printint(fd, va_arg(ap, uint64), 16, 0);
 7d2:	8ba6                	mv	s7,s1
      state = 0;
 7d4:	4981                	li	s3,0
 7d6:	bde9                	j	6b0 <vprintf+0x44>
        printint(fd, va_arg(ap, uint64), 16, 0);
 7d8:	008b8493          	addi	s1,s7,8
 7dc:	4681                	li	a3,0
 7de:	4641                	li	a2,16
 7e0:	000bb583          	ld	a1,0(s7)
 7e4:	855a                	mv	a0,s6
 7e6:	de9ff0ef          	jal	5ce <printint>
        i += 2;
 7ea:	2909                	addiw	s2,s2,2
        printint(fd, va_arg(ap, uint64), 16, 0);
 7ec:	8ba6                	mv	s7,s1
      state = 0;
 7ee:	4981                	li	s3,0
        i += 2;
 7f0:	b5c1                	j	6b0 <vprintf+0x44>
 7f2:	e466                	sd	s9,8(sp)
        printptr(fd, va_arg(ap, uint64));
 7f4:	008b8793          	addi	a5,s7,8
 7f8:	8cbe                	mv	s9,a5
 7fa:	000bb983          	ld	s3,0(s7)
  putc(fd, '0');
 7fe:	03000593          	li	a1,48
 802:	855a                	mv	a0,s6
 804:	dadff0ef          	jal	5b0 <putc>
  putc(fd, 'x');
 808:	07800593          	li	a1,120
 80c:	855a                	mv	a0,s6
 80e:	da3ff0ef          	jal	5b0 <putc>
 812:	44c1                	li	s1,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 814:	00000b97          	auipc	s7,0x0
 818:	3bcb8b93          	addi	s7,s7,956 # bd0 <digits>
 81c:	03c9d793          	srli	a5,s3,0x3c
 820:	97de                	add	a5,a5,s7
 822:	0007c583          	lbu	a1,0(a5)
 826:	855a                	mv	a0,s6
 828:	d89ff0ef          	jal	5b0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 82c:	0992                	slli	s3,s3,0x4
 82e:	34fd                	addiw	s1,s1,-1
 830:	f4f5                	bnez	s1,81c <vprintf+0x1b0>
        printptr(fd, va_arg(ap, uint64));
 832:	8be6                	mv	s7,s9
      state = 0;
 834:	4981                	li	s3,0
 836:	6ca2                	ld	s9,8(sp)
 838:	bda5                	j	6b0 <vprintf+0x44>
        putc(fd, va_arg(ap, uint32));
 83a:	008b8493          	addi	s1,s7,8
 83e:	000bc583          	lbu	a1,0(s7)
 842:	855a                	mv	a0,s6
 844:	d6dff0ef          	jal	5b0 <putc>
 848:	8ba6                	mv	s7,s1
      state = 0;
 84a:	4981                	li	s3,0
 84c:	b595                	j	6b0 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 84e:	008b8993          	addi	s3,s7,8
 852:	000bb483          	ld	s1,0(s7)
 856:	cc91                	beqz	s1,872 <vprintf+0x206>
        for(; *s; s++)
 858:	0004c583          	lbu	a1,0(s1)
 85c:	c985                	beqz	a1,88c <vprintf+0x220>
          putc(fd, *s);
 85e:	855a                	mv	a0,s6
 860:	d51ff0ef          	jal	5b0 <putc>
        for(; *s; s++)
 864:	0485                	addi	s1,s1,1
 866:	0004c583          	lbu	a1,0(s1)
 86a:	f9f5                	bnez	a1,85e <vprintf+0x1f2>
        if((s = va_arg(ap, char*)) == 0)
 86c:	8bce                	mv	s7,s3
      state = 0;
 86e:	4981                	li	s3,0
 870:	b581                	j	6b0 <vprintf+0x44>
          s = "(null)";
 872:	00000497          	auipc	s1,0x0
 876:	35648493          	addi	s1,s1,854 # bc8 <malloc+0x1ba>
        for(; *s; s++)
 87a:	02800593          	li	a1,40
 87e:	b7c5                	j	85e <vprintf+0x1f2>
        putc(fd, '%');
 880:	85be                	mv	a1,a5
 882:	855a                	mv	a0,s6
 884:	d2dff0ef          	jal	5b0 <putc>
      state = 0;
 888:	4981                	li	s3,0
 88a:	b51d                	j	6b0 <vprintf+0x44>
        if((s = va_arg(ap, char*)) == 0)
 88c:	8bce                	mv	s7,s3
      state = 0;
 88e:	4981                	li	s3,0
 890:	b505                	j	6b0 <vprintf+0x44>
 892:	6906                	ld	s2,64(sp)
 894:	79e2                	ld	s3,56(sp)
 896:	7a42                	ld	s4,48(sp)
 898:	7aa2                	ld	s5,40(sp)
 89a:	7b02                	ld	s6,32(sp)
 89c:	6be2                	ld	s7,24(sp)
 89e:	6c42                	ld	s8,16(sp)
    }
  }
}
 8a0:	60e6                	ld	ra,88(sp)
 8a2:	6446                	ld	s0,80(sp)
 8a4:	64a6                	ld	s1,72(sp)
 8a6:	6125                	addi	sp,sp,96
 8a8:	8082                	ret
      if(c0 == 'd'){
 8aa:	06400713          	li	a4,100
 8ae:	e4e78fe3          	beq	a5,a4,70c <vprintf+0xa0>
      } else if(c0 == 'l' && c1 == 'd'){
 8b2:	f9478693          	addi	a3,a5,-108
 8b6:	0016b693          	seqz	a3,a3
      c1 = c2 = 0;
 8ba:	85b2                	mv	a1,a2
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'd'){
 8bc:	4701                	li	a4,0
      } else if(c0 == 'u'){
 8be:	07500513          	li	a0,117
 8c2:	e8a78ce3          	beq	a5,a0,75a <vprintf+0xee>
      } else if(c0 == 'l' && c1 == 'u'){
 8c6:	f8b60513          	addi	a0,a2,-117
 8ca:	e119                	bnez	a0,8d0 <vprintf+0x264>
 8cc:	ea0693e3          	bnez	a3,772 <vprintf+0x106>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'u'){
 8d0:	f8b58513          	addi	a0,a1,-117
 8d4:	e119                	bnez	a0,8da <vprintf+0x26e>
 8d6:	ea071be3          	bnez	a4,78c <vprintf+0x120>
      } else if(c0 == 'x'){
 8da:	07800513          	li	a0,120
 8de:	eca784e3          	beq	a5,a0,7a6 <vprintf+0x13a>
      } else if(c0 == 'l' && c1 == 'x'){
 8e2:	f8860613          	addi	a2,a2,-120
 8e6:	e219                	bnez	a2,8ec <vprintf+0x280>
 8e8:	ec069be3          	bnez	a3,7be <vprintf+0x152>
      } else if(c0 == 'l' && c1 == 'l' && c2 == 'x'){
 8ec:	f8858593          	addi	a1,a1,-120
 8f0:	e199                	bnez	a1,8f6 <vprintf+0x28a>
 8f2:	ee0713e3          	bnez	a4,7d8 <vprintf+0x16c>
      } else if(c0 == 'p'){
 8f6:	07000713          	li	a4,112
 8fa:	eee78ce3          	beq	a5,a4,7f2 <vprintf+0x186>
      } else if(c0 == 'c'){
 8fe:	06300713          	li	a4,99
 902:	f2e78ce3          	beq	a5,a4,83a <vprintf+0x1ce>
      } else if(c0 == 's'){
 906:	07300713          	li	a4,115
 90a:	f4e782e3          	beq	a5,a4,84e <vprintf+0x1e2>
      } else if(c0 == '%'){
 90e:	02500713          	li	a4,37
 912:	f6e787e3          	beq	a5,a4,880 <vprintf+0x214>
        putc(fd, '%');
 916:	02500593          	li	a1,37
 91a:	855a                	mv	a0,s6
 91c:	c95ff0ef          	jal	5b0 <putc>
        putc(fd, c0);
 920:	85a6                	mv	a1,s1
 922:	855a                	mv	a0,s6
 924:	c8dff0ef          	jal	5b0 <putc>
      state = 0;
 928:	4981                	li	s3,0
 92a:	b359                	j	6b0 <vprintf+0x44>

000000000000092c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 92c:	715d                	addi	sp,sp,-80
 92e:	ec06                	sd	ra,24(sp)
 930:	e822                	sd	s0,16(sp)
 932:	1000                	addi	s0,sp,32
 934:	e010                	sd	a2,0(s0)
 936:	e414                	sd	a3,8(s0)
 938:	e818                	sd	a4,16(s0)
 93a:	ec1c                	sd	a5,24(s0)
 93c:	03043023          	sd	a6,32(s0)
 940:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 944:	8622                	mv	a2,s0
 946:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 94a:	d23ff0ef          	jal	66c <vprintf>
}
 94e:	60e2                	ld	ra,24(sp)
 950:	6442                	ld	s0,16(sp)
 952:	6161                	addi	sp,sp,80
 954:	8082                	ret

0000000000000956 <printf>:

void
printf(const char *fmt, ...)
{
 956:	711d                	addi	sp,sp,-96
 958:	ec06                	sd	ra,24(sp)
 95a:	e822                	sd	s0,16(sp)
 95c:	1000                	addi	s0,sp,32
 95e:	e40c                	sd	a1,8(s0)
 960:	e810                	sd	a2,16(s0)
 962:	ec14                	sd	a3,24(s0)
 964:	f018                	sd	a4,32(s0)
 966:	f41c                	sd	a5,40(s0)
 968:	03043823          	sd	a6,48(s0)
 96c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 970:	00840613          	addi	a2,s0,8
 974:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 978:	85aa                	mv	a1,a0
 97a:	4505                	li	a0,1
 97c:	cf1ff0ef          	jal	66c <vprintf>
}
 980:	60e2                	ld	ra,24(sp)
 982:	6442                	ld	s0,16(sp)
 984:	6125                	addi	sp,sp,96
 986:	8082                	ret

0000000000000988 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 988:	1141                	addi	sp,sp,-16
 98a:	e406                	sd	ra,8(sp)
 98c:	e022                	sd	s0,0(sp)
 98e:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 990:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 994:	00000797          	auipc	a5,0x0
 998:	66c7b783          	ld	a5,1644(a5) # 1000 <freep>
 99c:	a039                	j	9aa <free+0x22>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 99e:	6398                	ld	a4,0(a5)
 9a0:	00e7e463          	bltu	a5,a4,9a8 <free+0x20>
 9a4:	00e6ea63          	bltu	a3,a4,9b8 <free+0x30>
{
 9a8:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9aa:	fed7fae3          	bgeu	a5,a3,99e <free+0x16>
 9ae:	6398                	ld	a4,0(a5)
 9b0:	00e6e463          	bltu	a3,a4,9b8 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b4:	fee7eae3          	bltu	a5,a4,9a8 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b8:	ff852583          	lw	a1,-8(a0)
 9bc:	6390                	ld	a2,0(a5)
 9be:	02059813          	slli	a6,a1,0x20
 9c2:	01c85713          	srli	a4,a6,0x1c
 9c6:	9736                	add	a4,a4,a3
 9c8:	02e60563          	beq	a2,a4,9f2 <free+0x6a>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9cc:	fec53823          	sd	a2,-16(a0)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9d0:	4790                	lw	a2,8(a5)
 9d2:	02061593          	slli	a1,a2,0x20
 9d6:	01c5d713          	srli	a4,a1,0x1c
 9da:	973e                	add	a4,a4,a5
 9dc:	02e68263          	beq	a3,a4,a00 <free+0x78>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9e0:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 9e2:	00000717          	auipc	a4,0x0
 9e6:	60f73f23          	sd	a5,1566(a4) # 1000 <freep>
}
 9ea:	60a2                	ld	ra,8(sp)
 9ec:	6402                	ld	s0,0(sp)
 9ee:	0141                	addi	sp,sp,16
 9f0:	8082                	ret
    bp->s.size += p->s.ptr->s.size;
 9f2:	4618                	lw	a4,8(a2)
 9f4:	9f2d                	addw	a4,a4,a1
 9f6:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 9fa:	6398                	ld	a4,0(a5)
 9fc:	6310                	ld	a2,0(a4)
 9fe:	b7f9                	j	9cc <free+0x44>
    p->s.size += bp->s.size;
 a00:	ff852703          	lw	a4,-8(a0)
 a04:	9f31                	addw	a4,a4,a2
 a06:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 a08:	ff053683          	ld	a3,-16(a0)
 a0c:	bfd1                	j	9e0 <free+0x58>

0000000000000a0e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a0e:	7139                	addi	sp,sp,-64
 a10:	fc06                	sd	ra,56(sp)
 a12:	f822                	sd	s0,48(sp)
 a14:	f04a                	sd	s2,32(sp)
 a16:	ec4e                	sd	s3,24(sp)
 a18:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1a:	02051993          	slli	s3,a0,0x20
 a1e:	0209d993          	srli	s3,s3,0x20
 a22:	09bd                	addi	s3,s3,15
 a24:	0049d993          	srli	s3,s3,0x4
 a28:	2985                	addiw	s3,s3,1
 a2a:	894e                	mv	s2,s3
  if((prevp = freep) == 0){
 a2c:	00000517          	auipc	a0,0x0
 a30:	5d453503          	ld	a0,1492(a0) # 1000 <freep>
 a34:	c905                	beqz	a0,a64 <malloc+0x56>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a36:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a38:	4798                	lw	a4,8(a5)
 a3a:	09377663          	bgeu	a4,s3,ac6 <malloc+0xb8>
 a3e:	f426                	sd	s1,40(sp)
 a40:	e852                	sd	s4,16(sp)
 a42:	e456                	sd	s5,8(sp)
 a44:	e05a                	sd	s6,0(sp)
  if(nu < 4096)
 a46:	8a4e                	mv	s4,s3
 a48:	6705                	lui	a4,0x1
 a4a:	00e9f363          	bgeu	s3,a4,a50 <malloc+0x42>
 a4e:	6a05                	lui	s4,0x1
 a50:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 a54:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a58:	00000497          	auipc	s1,0x0
 a5c:	5a848493          	addi	s1,s1,1448 # 1000 <freep>
  if(p == SBRK_ERROR)
 a60:	5afd                	li	s5,-1
 a62:	a83d                	j	aa0 <malloc+0x92>
 a64:	f426                	sd	s1,40(sp)
 a66:	e852                	sd	s4,16(sp)
 a68:	e456                	sd	s5,8(sp)
 a6a:	e05a                	sd	s6,0(sp)
    base.s.ptr = freep = prevp = &base;
 a6c:	00001797          	auipc	a5,0x1
 a70:	a5478793          	addi	a5,a5,-1452 # 14c0 <base>
 a74:	00000717          	auipc	a4,0x0
 a78:	58f73623          	sd	a5,1420(a4) # 1000 <freep>
 a7c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a7e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a82:	b7d1                	j	a46 <malloc+0x38>
        prevp->s.ptr = p->s.ptr;
 a84:	6398                	ld	a4,0(a5)
 a86:	e118                	sd	a4,0(a0)
 a88:	a899                	j	ade <malloc+0xd0>
  hp->s.size = nu;
 a8a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a8e:	0541                	addi	a0,a0,16
 a90:	ef9ff0ef          	jal	988 <free>
  return freep;
 a94:	6088                	ld	a0,0(s1)
      if((p = morecore(nunits)) == 0)
 a96:	c125                	beqz	a0,af6 <malloc+0xe8>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a98:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a9a:	4798                	lw	a4,8(a5)
 a9c:	03277163          	bgeu	a4,s2,abe <malloc+0xb0>
    if(p == freep)
 aa0:	6098                	ld	a4,0(s1)
 aa2:	853e                	mv	a0,a5
 aa4:	fef71ae3          	bne	a4,a5,a98 <malloc+0x8a>
  p = sbrk(nu * sizeof(Header));
 aa8:	8552                	mv	a0,s4
 aaa:	a33ff0ef          	jal	4dc <sbrk>
  if(p == SBRK_ERROR)
 aae:	fd551ee3          	bne	a0,s5,a8a <malloc+0x7c>
        return 0;
 ab2:	4501                	li	a0,0
 ab4:	74a2                	ld	s1,40(sp)
 ab6:	6a42                	ld	s4,16(sp)
 ab8:	6aa2                	ld	s5,8(sp)
 aba:	6b02                	ld	s6,0(sp)
 abc:	a03d                	j	aea <malloc+0xdc>
 abe:	74a2                	ld	s1,40(sp)
 ac0:	6a42                	ld	s4,16(sp)
 ac2:	6aa2                	ld	s5,8(sp)
 ac4:	6b02                	ld	s6,0(sp)
      if(p->s.size == nunits)
 ac6:	fae90fe3          	beq	s2,a4,a84 <malloc+0x76>
        p->s.size -= nunits;
 aca:	4137073b          	subw	a4,a4,s3
 ace:	c798                	sw	a4,8(a5)
        p += p->s.size;
 ad0:	02071693          	slli	a3,a4,0x20
 ad4:	01c6d713          	srli	a4,a3,0x1c
 ad8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 ada:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 ade:	00000717          	auipc	a4,0x0
 ae2:	52a73123          	sd	a0,1314(a4) # 1000 <freep>
      return (void*)(p + 1);
 ae6:	01078513          	addi	a0,a5,16
  }
}
 aea:	70e2                	ld	ra,56(sp)
 aec:	7442                	ld	s0,48(sp)
 aee:	7902                	ld	s2,32(sp)
 af0:	69e2                	ld	s3,24(sp)
 af2:	6121                	addi	sp,sp,64
 af4:	8082                	ret
 af6:	74a2                	ld	s1,40(sp)
 af8:	6a42                	ld	s4,16(sp)
 afa:	6aa2                	ld	s5,8(sp)
 afc:	6b02                	ld	s6,0(sp)
 afe:	b7f5                	j	aea <malloc+0xdc>
