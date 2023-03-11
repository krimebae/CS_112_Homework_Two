
_lotterytest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "pstat.h"
#include "param.h"

void spin();

int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx

	struct pstat info;

	int i, rc;
	// create three children
	for(i = 0; i < 3; i++){
  10:	31 db                	xor    %ebx,%ebx
int main(int argc, char *argv[]){
  12:	51                   	push   %ecx
  13:	81 ec 38 04 00 00    	sub    $0x438,%esp
	int tickets[] = {100, 200, 300};
  19:	c7 85 d0 fb ff ff 64 	movl   $0x64,-0x430(%ebp)
  20:	00 00 00 
  23:	c7 85 d4 fb ff ff c8 	movl   $0xc8,-0x42c(%ebp)
  2a:	00 00 00 
  2d:	c7 85 d8 fb ff ff 2c 	movl   $0x12c,-0x428(%ebp)
  34:	01 00 00 
	int pids[] = {0, 0, 0};
  37:	c7 85 dc fb ff ff 00 	movl   $0x0,-0x424(%ebp)
  3e:	00 00 00 
  41:	c7 85 e0 fb ff ff 00 	movl   $0x0,-0x420(%ebp)
  48:	00 00 00 
  4b:	c7 85 e4 fb ff ff 00 	movl   $0x0,-0x41c(%ebp)
  52:	00 00 00 
		rc = fork();
  55:	e8 91 03 00 00       	call   3eb <fork>
		if(rc == 0) {
  5a:	85 c0                	test   %eax,%eax
  5c:	0f 84 ed 00 00 00    	je     14f <main+0x14f>
			settickets(tickets[i]);
			spin();
			exit();
		} else {
			pids[i] = rc;        
  62:	89 84 9d dc fb ff ff 	mov    %eax,-0x424(%ebp,%ebx,4)
	for(i = 0; i < 3; i++){
  69:	83 c3 01             	add    $0x1,%ebx
  6c:	83 fb 03             	cmp    $0x3,%ebx
  6f:	75 e4                	jne    55 <main+0x55>
		}
	}
	// prevent parent from using too much CPU
	settickets(10);
  71:	83 ec 0c             	sub    $0xc,%esp
  74:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
  7a:	8d b5 e8 fc ff ff    	lea    -0x318(%ebp),%esi
  80:	6a 0a                	push   $0xa
  82:	e8 24 04 00 00       	call   4ab <settickets>
  87:	83 c4 10             	add    $0x10,%esp
  8a:	c7 85 c4 fb ff ff 05 	movl   $0x5,-0x43c(%ebp)
  91:	00 00 00 


	// perodically print process information
	for(i = 0; i < 5; i++){
		sleep(500);
  94:	83 ec 0c             	sub    $0xc,%esp
  97:	68 f4 01 00 00       	push   $0x1f4
  9c:	e8 e2 03 00 00       	call   483 <sleep>
		if(getpinfo(&info) < 0)
  a1:	89 3c 24             	mov    %edi,(%esp)
  a4:	e8 fa 03 00 00       	call   4a3 <getpinfo>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	85 c0                	test   %eax,%eax
  ae:	0f 88 96 00 00 00    	js     14a <main+0x14a>
			exit();
		printf(1, "PID\tTICKETS\tTICKS\n");
  b4:	83 ec 08             	sub    $0x8,%esp
  b7:	89 fb                	mov    %edi,%ebx
  b9:	68 98 08 00 00       	push   $0x898
  be:	6a 01                	push   $0x1
  c0:	e8 ab 04 00 00       	call   570 <printf>
		for (int i = 0; i < NPROC; ++i) {
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	eb 0d                	jmp    d7 <main+0xd7>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	83 c3 04             	add    $0x4,%ebx
  d3:	39 f3                	cmp    %esi,%ebx
  d5:	74 30                	je     107 <main+0x107>
			if(info.inuse[i] == 1){
  d7:	83 3b 01             	cmpl   $0x1,(%ebx)
  da:	75 f4                	jne    d0 <main+0xd0>
				printf(1, "%d\t%d\t%d\n", info.pid[i], info.tickets[i], info.ticks[i]);
  dc:	83 ec 0c             	sub    $0xc,%esp
  df:	ff b3 00 03 00 00    	push   0x300(%ebx)
		for (int i = 0; i < NPROC; ++i) {
  e5:	83 c3 04             	add    $0x4,%ebx
				printf(1, "%d\t%d\t%d\n", info.pid[i], info.tickets[i], info.ticks[i]);
  e8:	ff b3 fc 00 00 00    	push   0xfc(%ebx)
  ee:	ff b3 fc 01 00 00    	push   0x1fc(%ebx)
  f4:	68 ab 08 00 00       	push   $0x8ab
  f9:	6a 01                	push   $0x1
  fb:	e8 70 04 00 00       	call   570 <printf>
 100:	83 c4 20             	add    $0x20,%esp
		for (int i = 0; i < NPROC; ++i) {
 103:	39 f3                	cmp    %esi,%ebx
 105:	75 d0                	jne    d7 <main+0xd7>
	for(i = 0; i < 5; i++){
 107:	83 ad c4 fb ff ff 01 	subl   $0x1,-0x43c(%ebp)
 10e:	75 84                	jne    94 <main+0x94>
		}
	}

	// kill all children
	for (int i = 0; i < 3; ++i) {
		kill(pids[i]);
 110:	83 ec 0c             	sub    $0xc,%esp
 113:	ff b5 dc fb ff ff    	push   -0x424(%ebp)
 119:	e8 05 03 00 00       	call   423 <kill>
 11e:	58                   	pop    %eax
 11f:	ff b5 e0 fb ff ff    	push   -0x420(%ebp)
 125:	e8 f9 02 00 00       	call   423 <kill>
 12a:	5a                   	pop    %edx
 12b:	ff b5 e4 fb ff ff    	push   -0x41c(%ebp)
 131:	e8 ed 02 00 00       	call   423 <kill>
	}
	for (int i = 0; i < 3; ++i) {
		wait();
 136:	e8 c0 02 00 00       	call   3fb <wait>
 13b:	e8 bb 02 00 00       	call   3fb <wait>
 140:	e8 b6 02 00 00       	call   3fb <wait>
	}
	exit();
 145:	e8 a9 02 00 00       	call   3f3 <exit>
			exit();
 14a:	e8 a4 02 00 00       	call   3f3 <exit>
			settickets(tickets[i]);
 14f:	83 ec 0c             	sub    $0xc,%esp
 152:	ff b4 9d d0 fb ff ff 	push   -0x430(%ebp,%ebx,4)
 159:	e8 4d 03 00 00       	call   4ab <settickets>
			spin();
 15e:	e8 0d 00 00 00       	call   170 <spin>
 163:	66 90                	xchg   %ax,%ax
 165:	66 90                	xchg   %ax,%ax
 167:	66 90                	xchg   %ax,%ax
 169:	66 90                	xchg   %ax,%ax
 16b:	66 90                	xchg   %ax,%ax
 16d:	66 90                	xchg   %ax,%ax
 16f:	90                   	nop

00000170 <spin>:
}

// infinite computing loop
void spin(){
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	83 ec 10             	sub    $0x10,%esp
	volatile int sink = 0;
 176:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 17d:	8d 76 00             	lea    0x0(%esi),%esi
	for(;;){
		sink = sink + 1;
 180:	8b 45 fc             	mov    -0x4(%ebp),%eax
 183:	83 c0 01             	add    $0x1,%eax
 186:	89 45 fc             	mov    %eax,-0x4(%ebp)
		sink = sink + 1;
 189:	8b 45 fc             	mov    -0x4(%ebp),%eax
 18c:	83 c0 01             	add    $0x1,%eax
 18f:	89 45 fc             	mov    %eax,-0x4(%ebp)
		sink = sink + 1;
 192:	8b 45 fc             	mov    -0x4(%ebp),%eax
 195:	83 c0 01             	add    $0x1,%eax
 198:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for(;;){
 19b:	eb e3                	jmp    180 <spin+0x10>
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a1:	31 c0                	xor    %eax,%eax
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	53                   	push   %ebx
 1a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c1:	89 c8                	mov    %ecx,%eax
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    
 1c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1da:	0f b6 02             	movzbl (%edx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 17                	jne    1f8 <strcmp+0x28>
 1e1:	eb 3a                	jmp    21d <strcmp+0x4d>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1f2:	84 c0                	test   %al,%al
 1f4:	74 1a                	je     210 <strcmp+0x40>
    p++, q++;
 1f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1f8:	0f b6 19             	movzbl (%ecx),%ebx
 1fb:	38 c3                	cmp    %al,%bl
 1fd:	74 e9                	je     1e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ff:	29 d8                	sub    %ebx,%eax
}
 201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 204:	c9                   	leave  
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 210:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 214:	31 c0                	xor    %eax,%eax
 216:	29 d8                	sub    %ebx,%eax
}
 218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21b:	c9                   	leave  
 21c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 21d:	0f b6 19             	movzbl (%ecx),%ebx
 220:	31 c0                	xor    %eax,%eax
 222:	eb db                	jmp    1ff <strcmp+0x2f>
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 3a 00             	cmpb   $0x0,(%edx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 c0                	xor    %eax,%eax
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c0 01             	add    $0x1,%eax
 243:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 247:	89 c1                	mov    %eax,%ecx
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	89 c8                	mov    %ecx,%eax
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop
  for(n = 0; s[n]; n++)
 250:	31 c9                	xor    %ecx,%ecx
}
 252:	5d                   	pop    %ebp
 253:	89 c8                	mov    %ecx,%eax
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	8b 7d fc             	mov    -0x4(%ebp),%edi
 275:	89 d0                	mov    %edx,%eax
 277:	c9                   	leave  
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	75 12                	jne    2a3 <strchr+0x23>
 291:	eb 1d                	jmp    2b0 <strchr+0x30>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	84 d2                	test   %dl,%dl
 2a1:	74 0d                	je     2b0 <strchr+0x30>
    if(*s == c)
 2a3:	38 d1                	cmp    %dl,%cl
 2a5:	75 f1                	jne    298 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2b0:	31 c0                	xor    %eax,%eax
}
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2c9:	31 db                	xor    %ebx,%ebx
{
 2cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ce:	eb 27                	jmp    2f7 <gets+0x37>
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 2e 01 00 00       	call   40b <read>
    if(cc < 1)
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
      break;
    buf[i++] = c;
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ef:	3c 0a                	cmp    $0xa,%al
 2f1:	74 1d                	je     310 <gets+0x50>
 2f3:	3c 0d                	cmp    $0xd,%al
 2f5:	74 19                	je     310 <gets+0x50>
  for(i=0; i+1 < max; ){
 2f7:	89 de                	mov    %ebx,%esi
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
  buf[i] = '\0';
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	push   0x8(%ebp)
 33d:	e8 f1 00 00 00       	call   433 <open>
  if(fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 f4 00 00 00       	call   44b <fstat>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
  close(fd);
 35c:	e8 ba 00 00 00       	call   41b <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 387:	0f be 02             	movsbl (%edx),%eax
 38a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 38d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 390:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 395:	77 1e                	ja     3b5 <atoi+0x35>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d4:	89 d7                	mov    %edx,%edi
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    

000003eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3eb:	b8 01 00 00 00       	mov    $0x1,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <exit>:
SYSCALL(exit)
 3f3:	b8 02 00 00 00       	mov    $0x2,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <wait>:
SYSCALL(wait)
 3fb:	b8 03 00 00 00       	mov    $0x3,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <pipe>:
SYSCALL(pipe)
 403:	b8 04 00 00 00       	mov    $0x4,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <read>:
SYSCALL(read)
 40b:	b8 05 00 00 00       	mov    $0x5,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <write>:
SYSCALL(write)
 413:	b8 10 00 00 00       	mov    $0x10,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <close>:
SYSCALL(close)
 41b:	b8 15 00 00 00       	mov    $0x15,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <kill>:
SYSCALL(kill)
 423:	b8 06 00 00 00       	mov    $0x6,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <exec>:
SYSCALL(exec)
 42b:	b8 07 00 00 00       	mov    $0x7,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <open>:
SYSCALL(open)
 433:	b8 0f 00 00 00       	mov    $0xf,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mknod>:
SYSCALL(mknod)
 43b:	b8 11 00 00 00       	mov    $0x11,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <unlink>:
SYSCALL(unlink)
 443:	b8 12 00 00 00       	mov    $0x12,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <fstat>:
SYSCALL(fstat)
 44b:	b8 08 00 00 00       	mov    $0x8,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <link>:
SYSCALL(link)
 453:	b8 13 00 00 00       	mov    $0x13,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mkdir>:
SYSCALL(mkdir)
 45b:	b8 14 00 00 00       	mov    $0x14,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <chdir>:
SYSCALL(chdir)
 463:	b8 09 00 00 00       	mov    $0x9,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <dup>:
SYSCALL(dup)
 46b:	b8 0a 00 00 00       	mov    $0xa,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <getpid>:
SYSCALL(getpid)
 473:	b8 0b 00 00 00       	mov    $0xb,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <sbrk>:
SYSCALL(sbrk)
 47b:	b8 0c 00 00 00       	mov    $0xc,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <sleep>:
SYSCALL(sleep)
 483:	b8 0d 00 00 00       	mov    $0xd,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <uptime>:
SYSCALL(uptime)
 48b:	b8 0e 00 00 00       	mov    $0xe,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getreadcount>:
SYSCALL(getreadcount)
 493:	b8 16 00 00 00       	mov    $0x16,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <getopenfilecount>:
SYSCALL(getopenfilecount)
 49b:	b8 17 00 00 00       	mov    $0x17,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <getpinfo>:
SYSCALL(getpinfo)
 4a3:	b8 19 00 00 00       	mov    $0x19,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <settickets>:
SYSCALL(settickets)
 4ab:	b8 18 00 00 00       	mov    $0x18,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    
 4b3:	66 90                	xchg   %ax,%ax
 4b5:	66 90                	xchg   %ax,%ax
 4b7:	66 90                	xchg   %ax,%ax
 4b9:	66 90                	xchg   %ax,%ax
 4bb:	66 90                	xchg   %ax,%ax
 4bd:	66 90                	xchg   %ax,%ax
 4bf:	90                   	nop

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	53                   	push   %ebx
 4c6:	83 ec 3c             	sub    $0x3c,%esp
 4c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4cc:	89 d1                	mov    %edx,%ecx
{
 4ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4d1:	85 d2                	test   %edx,%edx
 4d3:	0f 89 7f 00 00 00    	jns    558 <printint+0x98>
 4d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4dd:	74 79                	je     558 <printint+0x98>
    neg = 1;
 4df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4e8:	31 db                	xor    %ebx,%ebx
 4ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4f0:	89 c8                	mov    %ecx,%eax
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	89 cf                	mov    %ecx,%edi
 4f6:	f7 75 c4             	divl   -0x3c(%ebp)
 4f9:	0f b6 92 14 09 00 00 	movzbl 0x914(%edx),%edx
 500:	89 45 c0             	mov    %eax,-0x40(%ebp)
 503:	89 d8                	mov    %ebx,%eax
 505:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 508:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 50b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 50e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 511:	76 dd                	jbe    4f0 <printint+0x30>
  if(neg)
 513:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 516:	85 c9                	test   %ecx,%ecx
 518:	74 0c                	je     526 <printint+0x66>
    buf[i++] = '-';
 51a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 51f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 521:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 526:	8b 7d b8             	mov    -0x48(%ebp),%edi
 529:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 52d:	eb 07                	jmp    536 <printint+0x76>
 52f:	90                   	nop
    putc(fd, buf[i]);
 530:	0f b6 13             	movzbl (%ebx),%edx
 533:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 536:	83 ec 04             	sub    $0x4,%esp
 539:	88 55 d7             	mov    %dl,-0x29(%ebp)
 53c:	6a 01                	push   $0x1
 53e:	56                   	push   %esi
 53f:	57                   	push   %edi
 540:	e8 ce fe ff ff       	call   413 <write>
  while(--i >= 0)
 545:	83 c4 10             	add    $0x10,%esp
 548:	39 de                	cmp    %ebx,%esi
 54a:	75 e4                	jne    530 <printint+0x70>
}
 54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 54f:	5b                   	pop    %ebx
 550:	5e                   	pop    %esi
 551:	5f                   	pop    %edi
 552:	5d                   	pop    %ebp
 553:	c3                   	ret    
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 558:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 55f:	eb 87                	jmp    4e8 <printint+0x28>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
 576:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 579:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 57c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 57f:	0f b6 13             	movzbl (%ebx),%edx
 582:	84 d2                	test   %dl,%dl
 584:	74 6a                	je     5f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 586:	8d 45 10             	lea    0x10(%ebp),%eax
 589:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 58c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 58f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 591:	89 45 d0             	mov    %eax,-0x30(%ebp)
 594:	eb 36                	jmp    5cc <printf+0x5c>
 596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59d:	8d 76 00             	lea    0x0(%esi),%esi
 5a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	74 15                	je     5c2 <printf+0x52>
  write(fd, &c, 1);
 5ad:	83 ec 04             	sub    $0x4,%esp
 5b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5b3:	6a 01                	push   $0x1
 5b5:	57                   	push   %edi
 5b6:	56                   	push   %esi
 5b7:	e8 57 fe ff ff       	call   413 <write>
 5bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5c2:	0f b6 13             	movzbl (%ebx),%edx
 5c5:	83 c3 01             	add    $0x1,%ebx
 5c8:	84 d2                	test   %dl,%dl
 5ca:	74 24                	je     5f0 <printf+0x80>
    c = fmt[i] & 0xff;
 5cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5cf:	85 c9                	test   %ecx,%ecx
 5d1:	74 cd                	je     5a0 <printf+0x30>
      }
    } else if(state == '%'){
 5d3:	83 f9 25             	cmp    $0x25,%ecx
 5d6:	75 ea                	jne    5c2 <printf+0x52>
      if(c == 'd'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	0f 84 07 01 00 00    	je     6e8 <printf+0x178>
 5e1:	83 e8 63             	sub    $0x63,%eax
 5e4:	83 f8 15             	cmp    $0x15,%eax
 5e7:	77 17                	ja     600 <printf+0x90>
 5e9:	ff 24 85 bc 08 00 00 	jmp    *0x8bc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret    
 5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 606:	6a 01                	push   $0x1
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 60e:	e8 00 fe ff ff       	call   413 <write>
        putc(fd, c);
 613:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 617:	83 c4 0c             	add    $0xc,%esp
 61a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 61d:	6a 01                	push   $0x1
 61f:	57                   	push   %edi
 620:	56                   	push   %esi
 621:	e8 ed fd ff ff       	call   413 <write>
        putc(fd, c);
 626:	83 c4 10             	add    $0x10,%esp
      state = 0;
 629:	31 c9                	xor    %ecx,%ecx
 62b:	eb 95                	jmp    5c2 <printf+0x52>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
 638:	6a 00                	push   $0x0
 63a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 63d:	8b 10                	mov    (%eax),%edx
 63f:	89 f0                	mov    %esi,%eax
 641:	e8 7a fe ff ff       	call   4c0 <printint>
        ap++;
 646:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 64a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64d:	31 c9                	xor    %ecx,%ecx
 64f:	e9 6e ff ff ff       	jmp    5c2 <printf+0x52>
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 658:	8b 45 d0             	mov    -0x30(%ebp),%eax
 65b:	8b 10                	mov    (%eax),%edx
        ap++;
 65d:	83 c0 04             	add    $0x4,%eax
 660:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 663:	85 d2                	test   %edx,%edx
 665:	0f 84 8d 00 00 00    	je     6f8 <printf+0x188>
        while(*s != 0){
 66b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 66e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 670:	84 c0                	test   %al,%al
 672:	0f 84 4a ff ff ff    	je     5c2 <printf+0x52>
 678:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 67b:	89 d3                	mov    %edx,%ebx
 67d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 680:	83 ec 04             	sub    $0x4,%esp
          s++;
 683:	83 c3 01             	add    $0x1,%ebx
 686:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 689:	6a 01                	push   $0x1
 68b:	57                   	push   %edi
 68c:	56                   	push   %esi
 68d:	e8 81 fd ff ff       	call   413 <write>
        while(*s != 0){
 692:	0f b6 03             	movzbl (%ebx),%eax
 695:	83 c4 10             	add    $0x10,%esp
 698:	84 c0                	test   %al,%al
 69a:	75 e4                	jne    680 <printf+0x110>
      state = 0;
 69c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 69f:	31 c9                	xor    %ecx,%ecx
 6a1:	e9 1c ff ff ff       	jmp    5c2 <printf+0x52>
 6a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 7b ff ff ff       	jmp    63a <printf+0xca>
 6bf:	90                   	nop
        putc(fd, *ap);
 6c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6c8:	6a 01                	push   $0x1
 6ca:	57                   	push   %edi
 6cb:	56                   	push   %esi
        putc(fd, *ap);
 6cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6cf:	e8 3f fd ff ff       	call   413 <write>
        ap++;
 6d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6db:	31 c9                	xor    %ecx,%ecx
 6dd:	e9 e0 fe ff ff       	jmp    5c2 <printf+0x52>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6eb:	83 ec 04             	sub    $0x4,%esp
 6ee:	e9 2a ff ff ff       	jmp    61d <printf+0xad>
 6f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6f7:	90                   	nop
          s = "(null)";
 6f8:	ba b5 08 00 00       	mov    $0x8b5,%edx
        while(*s != 0){
 6fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 700:	b8 28 00 00 00       	mov    $0x28,%eax
 705:	89 d3                	mov    %edx,%ebx
 707:	e9 74 ff ff ff       	jmp    680 <printf+0x110>
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 e8 0b 00 00       	mov    0xbe8,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 728:	89 c2                	mov    %eax,%edx
 72a:	8b 00                	mov    (%eax),%eax
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	73 30                	jae    760 <free+0x50>
 730:	39 c1                	cmp    %eax,%ecx
 732:	72 04                	jb     738 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	39 c2                	cmp    %eax,%edx
 736:	72 f0                	jb     728 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	74 30                	je     772 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 742:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 745:	8b 42 04             	mov    0x4(%edx),%eax
 748:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 74b:	39 f1                	cmp    %esi,%ecx
 74d:	74 3a                	je     789 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 74f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 751:	5b                   	pop    %ebx
  freep = p;
 752:	89 15 e8 0b 00 00    	mov    %edx,0xbe8
}
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 c2                	cmp    %eax,%edx
 762:	72 c4                	jb     728 <free+0x18>
 764:	39 c1                	cmp    %eax,%ecx
 766:	73 c0                	jae    728 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	75 d0                	jne    742 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 772:	03 70 04             	add    0x4(%eax),%esi
 775:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 778:	8b 02                	mov    (%edx),%eax
 77a:	8b 00                	mov    (%eax),%eax
 77c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 77f:	8b 42 04             	mov    0x4(%edx),%eax
 782:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 785:	39 f1                	cmp    %esi,%ecx
 787:	75 c6                	jne    74f <free+0x3f>
    p->s.size += bp->s.size;
 789:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 78c:	89 15 e8 0b 00 00    	mov    %edx,0xbe8
    p->s.size += bp->s.size;
 792:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 795:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 798:	89 0a                	mov    %ecx,(%edx)
}
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    
 79f:	90                   	nop

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 3d e8 0b 00 00    	mov    0xbe8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 70 07             	lea    0x7(%eax),%esi
 7b5:	c1 ee 03             	shr    $0x3,%esi
 7b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7bb:	85 ff                	test   %edi,%edi
 7bd:	0f 84 9d 00 00 00    	je     860 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7c8:	39 f1                	cmp    %esi,%ecx
 7ca:	73 6a                	jae    836 <malloc+0x96>
 7cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d1:	39 de                	cmp    %ebx,%esi
 7d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7e0:	eb 17                	jmp    7f9 <malloc+0x59>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ea:	8b 48 04             	mov    0x4(%eax),%ecx
 7ed:	39 f1                	cmp    %esi,%ecx
 7ef:	73 4f                	jae    840 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f1:	8b 3d e8 0b 00 00    	mov    0xbe8,%edi
 7f7:	89 c2                	mov    %eax,%edx
 7f9:	39 d7                	cmp    %edx,%edi
 7fb:	75 eb                	jne    7e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7fd:	83 ec 0c             	sub    $0xc,%esp
 800:	ff 75 e4             	push   -0x1c(%ebp)
 803:	e8 73 fc ff ff       	call   47b <sbrk>
  if(p == (char*)-1)
 808:	83 c4 10             	add    $0x10,%esp
 80b:	83 f8 ff             	cmp    $0xffffffff,%eax
 80e:	74 1c                	je     82c <malloc+0x8c>
  hp->s.size = nu;
 810:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 813:	83 ec 0c             	sub    $0xc,%esp
 816:	83 c0 08             	add    $0x8,%eax
 819:	50                   	push   %eax
 81a:	e8 f1 fe ff ff       	call   710 <free>
  return freep;
 81f:	8b 15 e8 0b 00 00    	mov    0xbe8,%edx
      if((p = morecore(nunits)) == 0)
 825:	83 c4 10             	add    $0x10,%esp
 828:	85 d2                	test   %edx,%edx
 82a:	75 bc                	jne    7e8 <malloc+0x48>
        return 0;
  }
}
 82c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 82f:	31 c0                	xor    %eax,%eax
}
 831:	5b                   	pop    %ebx
 832:	5e                   	pop    %esi
 833:	5f                   	pop    %edi
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    
    if(p->s.size >= nunits){
 836:	89 d0                	mov    %edx,%eax
 838:	89 fa                	mov    %edi,%edx
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 840:	39 ce                	cmp    %ecx,%esi
 842:	74 4c                	je     890 <malloc+0xf0>
        p->s.size -= nunits;
 844:	29 f1                	sub    %esi,%ecx
 846:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 849:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 84c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 84f:	89 15 e8 0b 00 00    	mov    %edx,0xbe8
}
 855:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 858:	83 c0 08             	add    $0x8,%eax
}
 85b:	5b                   	pop    %ebx
 85c:	5e                   	pop    %esi
 85d:	5f                   	pop    %edi
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 e8 0b 00 00 ec 	movl   $0xbec,0xbe8
 867:	0b 00 00 
    base.s.size = 0;
 86a:	bf ec 0b 00 00       	mov    $0xbec,%edi
    base.s.ptr = freep = prevp = &base;
 86f:	c7 05 ec 0b 00 00 ec 	movl   $0xbec,0xbec
 876:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 879:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 87b:	c7 05 f0 0b 00 00 00 	movl   $0x0,0xbf0
 882:	00 00 00 
    if(p->s.size >= nunits){
 885:	e9 42 ff ff ff       	jmp    7cc <malloc+0x2c>
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb b9                	jmp    84f <malloc+0xaf>
