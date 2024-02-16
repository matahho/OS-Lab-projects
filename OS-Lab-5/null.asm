
_null:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
int *i = 0;

(*i)++;
    1004:	a1 00 00 00 00       	mov    0x0,%eax
    1009:	0f 0b                	ud2    
    100b:	66 90                	xchg   %ax,%ax
    100d:	66 90                	xchg   %ax,%ax
    100f:	90                   	nop

00001010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1010:	f3 0f 1e fb          	endbr32 
    1014:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1015:	31 c0                	xor    %eax,%eax
{
    1017:	89 e5                	mov    %esp,%ebp
    1019:	53                   	push   %ebx
    101a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    101d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1020:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1024:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1027:	83 c0 01             	add    $0x1,%eax
    102a:	84 d2                	test   %dl,%dl
    102c:	75 f2                	jne    1020 <strcpy+0x10>
    ;
  return os;
}
    102e:	89 c8                	mov    %ecx,%eax
    1030:	5b                   	pop    %ebx
    1031:	5d                   	pop    %ebp
    1032:	c3                   	ret    
    1033:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1040:	f3 0f 1e fb          	endbr32 
    1044:	55                   	push   %ebp
    1045:	89 e5                	mov    %esp,%ebp
    1047:	53                   	push   %ebx
    1048:	8b 4d 08             	mov    0x8(%ebp),%ecx
    104b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    104e:	0f b6 01             	movzbl (%ecx),%eax
    1051:	0f b6 1a             	movzbl (%edx),%ebx
    1054:	84 c0                	test   %al,%al
    1056:	75 19                	jne    1071 <strcmp+0x31>
    1058:	eb 26                	jmp    1080 <strcmp+0x40>
    105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1060:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1064:	83 c1 01             	add    $0x1,%ecx
    1067:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    106a:	0f b6 1a             	movzbl (%edx),%ebx
    106d:	84 c0                	test   %al,%al
    106f:	74 0f                	je     1080 <strcmp+0x40>
    1071:	38 d8                	cmp    %bl,%al
    1073:	74 eb                	je     1060 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1075:	29 d8                	sub    %ebx,%eax
}
    1077:	5b                   	pop    %ebx
    1078:	5d                   	pop    %ebp
    1079:	c3                   	ret    
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1080:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1082:	29 d8                	sub    %ebx,%eax
}
    1084:	5b                   	pop    %ebx
    1085:	5d                   	pop    %ebp
    1086:	c3                   	ret    
    1087:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108e:	66 90                	xchg   %ax,%ax

00001090 <strlen>:

uint
strlen(char *s)
{
    1090:	f3 0f 1e fb          	endbr32 
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
    1097:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    109a:	80 3a 00             	cmpb   $0x0,(%edx)
    109d:	74 21                	je     10c0 <strlen+0x30>
    109f:	31 c0                	xor    %eax,%eax
    10a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10a8:	83 c0 01             	add    $0x1,%eax
    10ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10af:	89 c1                	mov    %eax,%ecx
    10b1:	75 f5                	jne    10a8 <strlen+0x18>
    ;
  return n;
}
    10b3:	89 c8                	mov    %ecx,%eax
    10b5:	5d                   	pop    %ebp
    10b6:	c3                   	ret    
    10b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    10c0:	31 c9                	xor    %ecx,%ecx
}
    10c2:	5d                   	pop    %ebp
    10c3:	89 c8                	mov    %ecx,%eax
    10c5:	c3                   	ret    
    10c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10cd:	8d 76 00             	lea    0x0(%esi),%esi

000010d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10d0:	f3 0f 1e fb          	endbr32 
    10d4:	55                   	push   %ebp
    10d5:	89 e5                	mov    %esp,%ebp
    10d7:	57                   	push   %edi
    10d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10db:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10de:	8b 45 0c             	mov    0xc(%ebp),%eax
    10e1:	89 d7                	mov    %edx,%edi
    10e3:	fc                   	cld    
    10e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10e6:	89 d0                	mov    %edx,%eax
    10e8:	5f                   	pop    %edi
    10e9:	5d                   	pop    %ebp
    10ea:	c3                   	ret    
    10eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10ef:	90                   	nop

000010f0 <strchr>:

char*
strchr(const char *s, char c)
{
    10f0:	f3 0f 1e fb          	endbr32 
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	8b 45 08             	mov    0x8(%ebp),%eax
    10fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    10fe:	0f b6 10             	movzbl (%eax),%edx
    1101:	84 d2                	test   %dl,%dl
    1103:	75 16                	jne    111b <strchr+0x2b>
    1105:	eb 21                	jmp    1128 <strchr+0x38>
    1107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110e:	66 90                	xchg   %ax,%ax
    1110:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1114:	83 c0 01             	add    $0x1,%eax
    1117:	84 d2                	test   %dl,%dl
    1119:	74 0d                	je     1128 <strchr+0x38>
    if(*s == c)
    111b:	38 d1                	cmp    %dl,%cl
    111d:	75 f1                	jne    1110 <strchr+0x20>
      return (char*)s;
  return 0;
}
    111f:	5d                   	pop    %ebp
    1120:	c3                   	ret    
    1121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1128:	31 c0                	xor    %eax,%eax
}
    112a:	5d                   	pop    %ebp
    112b:	c3                   	ret    
    112c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001130 <gets>:

char*
gets(char *buf, int max)
{
    1130:	f3 0f 1e fb          	endbr32 
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	57                   	push   %edi
    1138:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1139:	31 f6                	xor    %esi,%esi
{
    113b:	53                   	push   %ebx
    113c:	89 f3                	mov    %esi,%ebx
    113e:	83 ec 1c             	sub    $0x1c,%esp
    1141:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1144:	eb 33                	jmp    1179 <gets+0x49>
    1146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    114d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1150:	83 ec 04             	sub    $0x4,%esp
    1153:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1156:	6a 01                	push   $0x1
    1158:	50                   	push   %eax
    1159:	6a 00                	push   $0x0
    115b:	e8 2b 01 00 00       	call   128b <read>
    if(cc < 1)
    1160:	83 c4 10             	add    $0x10,%esp
    1163:	85 c0                	test   %eax,%eax
    1165:	7e 1c                	jle    1183 <gets+0x53>
      break;
    buf[i++] = c;
    1167:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    116b:	83 c7 01             	add    $0x1,%edi
    116e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1171:	3c 0a                	cmp    $0xa,%al
    1173:	74 23                	je     1198 <gets+0x68>
    1175:	3c 0d                	cmp    $0xd,%al
    1177:	74 1f                	je     1198 <gets+0x68>
  for(i=0; i+1 < max; ){
    1179:	83 c3 01             	add    $0x1,%ebx
    117c:	89 fe                	mov    %edi,%esi
    117e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1181:	7c cd                	jl     1150 <gets+0x20>
    1183:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1185:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1188:	c6 03 00             	movb   $0x0,(%ebx)
}
    118b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    118e:	5b                   	pop    %ebx
    118f:	5e                   	pop    %esi
    1190:	5f                   	pop    %edi
    1191:	5d                   	pop    %ebp
    1192:	c3                   	ret    
    1193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1197:	90                   	nop
    1198:	8b 75 08             	mov    0x8(%ebp),%esi
    119b:	8b 45 08             	mov    0x8(%ebp),%eax
    119e:	01 de                	add    %ebx,%esi
    11a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11a2:	c6 03 00             	movb   $0x0,(%ebx)
}
    11a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11a8:	5b                   	pop    %ebx
    11a9:	5e                   	pop    %esi
    11aa:	5f                   	pop    %edi
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
    11ad:	8d 76 00             	lea    0x0(%esi),%esi

000011b0 <stat>:

int
stat(char *n, struct stat *st)
{
    11b0:	f3 0f 1e fb          	endbr32 
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	56                   	push   %esi
    11b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b9:	83 ec 08             	sub    $0x8,%esp
    11bc:	6a 00                	push   $0x0
    11be:	ff 75 08             	pushl  0x8(%ebp)
    11c1:	e8 ed 00 00 00       	call   12b3 <open>
  if(fd < 0)
    11c6:	83 c4 10             	add    $0x10,%esp
    11c9:	85 c0                	test   %eax,%eax
    11cb:	78 2b                	js     11f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11cd:	83 ec 08             	sub    $0x8,%esp
    11d0:	ff 75 0c             	pushl  0xc(%ebp)
    11d3:	89 c3                	mov    %eax,%ebx
    11d5:	50                   	push   %eax
    11d6:	e8 f0 00 00 00       	call   12cb <fstat>
  close(fd);
    11db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11de:	89 c6                	mov    %eax,%esi
  close(fd);
    11e0:	e8 b6 00 00 00       	call   129b <close>
  return r;
    11e5:	83 c4 10             	add    $0x10,%esp
}
    11e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11eb:	89 f0                	mov    %esi,%eax
    11ed:	5b                   	pop    %ebx
    11ee:	5e                   	pop    %esi
    11ef:	5d                   	pop    %ebp
    11f0:	c3                   	ret    
    11f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    11f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    11fd:	eb e9                	jmp    11e8 <stat+0x38>
    11ff:	90                   	nop

00001200 <atoi>:

int
atoi(const char *s)
{
    1200:	f3 0f 1e fb          	endbr32 
    1204:	55                   	push   %ebp
    1205:	89 e5                	mov    %esp,%ebp
    1207:	53                   	push   %ebx
    1208:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    120b:	0f be 02             	movsbl (%edx),%eax
    120e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1211:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1214:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1219:	77 1a                	ja     1235 <atoi+0x35>
    121b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    121f:	90                   	nop
    n = n*10 + *s++ - '0';
    1220:	83 c2 01             	add    $0x1,%edx
    1223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1226:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    122a:	0f be 02             	movsbl (%edx),%eax
    122d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1230:	80 fb 09             	cmp    $0x9,%bl
    1233:	76 eb                	jbe    1220 <atoi+0x20>
  return n;
}
    1235:	89 c8                	mov    %ecx,%eax
    1237:	5b                   	pop    %ebx
    1238:	5d                   	pop    %ebp
    1239:	c3                   	ret    
    123a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001240 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1240:	f3 0f 1e fb          	endbr32 
    1244:	55                   	push   %ebp
    1245:	89 e5                	mov    %esp,%ebp
    1247:	57                   	push   %edi
    1248:	8b 45 10             	mov    0x10(%ebp),%eax
    124b:	8b 55 08             	mov    0x8(%ebp),%edx
    124e:	56                   	push   %esi
    124f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1252:	85 c0                	test   %eax,%eax
    1254:	7e 0f                	jle    1265 <memmove+0x25>
    1256:	01 d0                	add    %edx,%eax
  dst = vdst;
    1258:	89 d7                	mov    %edx,%edi
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1260:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1261:	39 f8                	cmp    %edi,%eax
    1263:	75 fb                	jne    1260 <memmove+0x20>
  return vdst;
}
    1265:	5e                   	pop    %esi
    1266:	89 d0                	mov    %edx,%eax
    1268:	5f                   	pop    %edi
    1269:	5d                   	pop    %ebp
    126a:	c3                   	ret    

0000126b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    126b:	b8 01 00 00 00       	mov    $0x1,%eax
    1270:	cd 40                	int    $0x40
    1272:	c3                   	ret    

00001273 <exit>:
SYSCALL(exit)
    1273:	b8 02 00 00 00       	mov    $0x2,%eax
    1278:	cd 40                	int    $0x40
    127a:	c3                   	ret    

0000127b <wait>:
SYSCALL(wait)
    127b:	b8 03 00 00 00       	mov    $0x3,%eax
    1280:	cd 40                	int    $0x40
    1282:	c3                   	ret    

00001283 <pipe>:
SYSCALL(pipe)
    1283:	b8 04 00 00 00       	mov    $0x4,%eax
    1288:	cd 40                	int    $0x40
    128a:	c3                   	ret    

0000128b <read>:
SYSCALL(read)
    128b:	b8 05 00 00 00       	mov    $0x5,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret    

00001293 <write>:
SYSCALL(write)
    1293:	b8 10 00 00 00       	mov    $0x10,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret    

0000129b <close>:
SYSCALL(close)
    129b:	b8 15 00 00 00       	mov    $0x15,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <kill>:
SYSCALL(kill)
    12a3:	b8 06 00 00 00       	mov    $0x6,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <exec>:
SYSCALL(exec)
    12ab:	b8 07 00 00 00       	mov    $0x7,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <open>:
SYSCALL(open)
    12b3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <mknod>:
SYSCALL(mknod)
    12bb:	b8 11 00 00 00       	mov    $0x11,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <unlink>:
SYSCALL(unlink)
    12c3:	b8 12 00 00 00       	mov    $0x12,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <fstat>:
SYSCALL(fstat)
    12cb:	b8 08 00 00 00       	mov    $0x8,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <link>:
SYSCALL(link)
    12d3:	b8 13 00 00 00       	mov    $0x13,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <mkdir>:
SYSCALL(mkdir)
    12db:	b8 14 00 00 00       	mov    $0x14,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <chdir>:
SYSCALL(chdir)
    12e3:	b8 09 00 00 00       	mov    $0x9,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <dup>:
SYSCALL(dup)
    12eb:	b8 0a 00 00 00       	mov    $0xa,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <getpid>:
SYSCALL(getpid)
    12f3:	b8 0b 00 00 00       	mov    $0xb,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <sbrk>:
SYSCALL(sbrk)
    12fb:	b8 0c 00 00 00       	mov    $0xc,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <sleep>:
SYSCALL(sleep)
    1303:	b8 0d 00 00 00       	mov    $0xd,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <uptime>:
SYSCALL(uptime)
    130b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <shm_open>:
SYSCALL(shm_open)
    1313:	b8 16 00 00 00       	mov    $0x16,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <shm_close>:
SYSCALL(shm_close)	
    131b:	b8 17 00 00 00       	mov    $0x17,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    
    1323:	66 90                	xchg   %ax,%ax
    1325:	66 90                	xchg   %ax,%ax
    1327:	66 90                	xchg   %ax,%ax
    1329:	66 90                	xchg   %ax,%ax
    132b:	66 90                	xchg   %ax,%ax
    132d:	66 90                	xchg   %ax,%ax
    132f:	90                   	nop

00001330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	57                   	push   %edi
    1334:	56                   	push   %esi
    1335:	53                   	push   %ebx
    1336:	83 ec 3c             	sub    $0x3c,%esp
    1339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    133c:	89 d1                	mov    %edx,%ecx
{
    133e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1341:	85 d2                	test   %edx,%edx
    1343:	0f 89 7f 00 00 00    	jns    13c8 <printint+0x98>
    1349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    134d:	74 79                	je     13c8 <printint+0x98>
    neg = 1;
    134f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1358:	31 db                	xor    %ebx,%ebx
    135a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    135d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1360:	89 c8                	mov    %ecx,%eax
    1362:	31 d2                	xor    %edx,%edx
    1364:	89 cf                	mov    %ecx,%edi
    1366:	f7 75 c4             	divl   -0x3c(%ebp)
    1369:	0f b6 92 90 17 00 00 	movzbl 0x1790(%edx),%edx
    1370:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1373:	89 d8                	mov    %ebx,%eax
    1375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    137b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    137e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1381:	76 dd                	jbe    1360 <printint+0x30>
  if(neg)
    1383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1386:	85 c9                	test   %ecx,%ecx
    1388:	74 0c                	je     1396 <printint+0x66>
    buf[i++] = '-';
    138a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    138f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1396:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    139d:	eb 07                	jmp    13a6 <printint+0x76>
    139f:	90                   	nop
    13a0:	0f b6 13             	movzbl (%ebx),%edx
    13a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13a6:	83 ec 04             	sub    $0x4,%esp
    13a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13ac:	6a 01                	push   $0x1
    13ae:	56                   	push   %esi
    13af:	57                   	push   %edi
    13b0:	e8 de fe ff ff       	call   1293 <write>
  while(--i >= 0)
    13b5:	83 c4 10             	add    $0x10,%esp
    13b8:	39 de                	cmp    %ebx,%esi
    13ba:	75 e4                	jne    13a0 <printint+0x70>
    putc(fd, buf[i]);
}
    13bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13bf:	5b                   	pop    %ebx
    13c0:	5e                   	pop    %esi
    13c1:	5f                   	pop    %edi
    13c2:	5d                   	pop    %ebp
    13c3:	c3                   	ret    
    13c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13cf:	eb 87                	jmp    1358 <printint+0x28>
    13d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13df:	90                   	nop

000013e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13e0:	f3 0f 1e fb          	endbr32 
    13e4:	55                   	push   %ebp
    13e5:	89 e5                	mov    %esp,%ebp
    13e7:	57                   	push   %edi
    13e8:	56                   	push   %esi
    13e9:	53                   	push   %ebx
    13ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13ed:	8b 75 0c             	mov    0xc(%ebp),%esi
    13f0:	0f b6 1e             	movzbl (%esi),%ebx
    13f3:	84 db                	test   %bl,%bl
    13f5:	0f 84 b4 00 00 00    	je     14af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    13fb:	8d 45 10             	lea    0x10(%ebp),%eax
    13fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1401:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1404:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1406:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1409:	eb 33                	jmp    143e <printf+0x5e>
    140b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    140f:	90                   	nop
    1410:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1413:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1418:	83 f8 25             	cmp    $0x25,%eax
    141b:	74 17                	je     1434 <printf+0x54>
  write(fd, &c, 1);
    141d:	83 ec 04             	sub    $0x4,%esp
    1420:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1423:	6a 01                	push   $0x1
    1425:	57                   	push   %edi
    1426:	ff 75 08             	pushl  0x8(%ebp)
    1429:	e8 65 fe ff ff       	call   1293 <write>
    142e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1431:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1434:	0f b6 1e             	movzbl (%esi),%ebx
    1437:	83 c6 01             	add    $0x1,%esi
    143a:	84 db                	test   %bl,%bl
    143c:	74 71                	je     14af <printf+0xcf>
    c = fmt[i] & 0xff;
    143e:	0f be cb             	movsbl %bl,%ecx
    1441:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1444:	85 d2                	test   %edx,%edx
    1446:	74 c8                	je     1410 <printf+0x30>
      }
    } else if(state == '%'){
    1448:	83 fa 25             	cmp    $0x25,%edx
    144b:	75 e7                	jne    1434 <printf+0x54>
      if(c == 'd'){
    144d:	83 f8 64             	cmp    $0x64,%eax
    1450:	0f 84 9a 00 00 00    	je     14f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1456:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    145c:	83 f9 70             	cmp    $0x70,%ecx
    145f:	74 5f                	je     14c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1461:	83 f8 73             	cmp    $0x73,%eax
    1464:	0f 84 d6 00 00 00    	je     1540 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    146a:	83 f8 63             	cmp    $0x63,%eax
    146d:	0f 84 8d 00 00 00    	je     1500 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1473:	83 f8 25             	cmp    $0x25,%eax
    1476:	0f 84 b4 00 00 00    	je     1530 <printf+0x150>
  write(fd, &c, 1);
    147c:	83 ec 04             	sub    $0x4,%esp
    147f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	ff 75 08             	pushl  0x8(%ebp)
    1489:	e8 05 fe ff ff       	call   1293 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    148e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1491:	83 c4 0c             	add    $0xc,%esp
    1494:	6a 01                	push   $0x1
    1496:	83 c6 01             	add    $0x1,%esi
    1499:	57                   	push   %edi
    149a:	ff 75 08             	pushl  0x8(%ebp)
    149d:	e8 f1 fd ff ff       	call   1293 <write>
  for(i = 0; fmt[i]; i++){
    14a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14ab:	84 db                	test   %bl,%bl
    14ad:	75 8f                	jne    143e <printf+0x5e>
    }
  }
}
    14af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14b2:	5b                   	pop    %ebx
    14b3:	5e                   	pop    %esi
    14b4:	5f                   	pop    %edi
    14b5:	5d                   	pop    %ebp
    14b6:	c3                   	ret    
    14b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14c8:	6a 00                	push   $0x0
    14ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14cd:	8b 45 08             	mov    0x8(%ebp),%eax
    14d0:	8b 13                	mov    (%ebx),%edx
    14d2:	e8 59 fe ff ff       	call   1330 <printint>
        ap++;
    14d7:	89 d8                	mov    %ebx,%eax
    14d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14dc:	31 d2                	xor    %edx,%edx
        ap++;
    14de:	83 c0 04             	add    $0x4,%eax
    14e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e4:	e9 4b ff ff ff       	jmp    1434 <printf+0x54>
    14e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    14f8:	6a 01                	push   $0x1
    14fa:	eb ce                	jmp    14ca <printf+0xea>
    14fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1500:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1503:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1506:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1508:	6a 01                	push   $0x1
        ap++;
    150a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    150d:	57                   	push   %edi
    150e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1511:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1514:	e8 7a fd ff ff       	call   1293 <write>
        ap++;
    1519:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    151c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    151f:	31 d2                	xor    %edx,%edx
    1521:	e9 0e ff ff ff       	jmp    1434 <printf+0x54>
    1526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1530:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1533:	83 ec 04             	sub    $0x4,%esp
    1536:	e9 59 ff ff ff       	jmp    1494 <printf+0xb4>
    153b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    153f:	90                   	nop
        s = (char*)*ap;
    1540:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1543:	8b 18                	mov    (%eax),%ebx
        ap++;
    1545:	83 c0 04             	add    $0x4,%eax
    1548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    154b:	85 db                	test   %ebx,%ebx
    154d:	74 17                	je     1566 <printf+0x186>
        while(*s != 0){
    154f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1552:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1554:	84 c0                	test   %al,%al
    1556:	0f 84 d8 fe ff ff    	je     1434 <printf+0x54>
    155c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    155f:	89 de                	mov    %ebx,%esi
    1561:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1564:	eb 1a                	jmp    1580 <printf+0x1a0>
          s = "(null)";
    1566:	bb 88 17 00 00       	mov    $0x1788,%ebx
        while(*s != 0){
    156b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    156e:	b8 28 00 00 00       	mov    $0x28,%eax
    1573:	89 de                	mov    %ebx,%esi
    1575:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157f:	90                   	nop
  write(fd, &c, 1);
    1580:	83 ec 04             	sub    $0x4,%esp
          s++;
    1583:	83 c6 01             	add    $0x1,%esi
    1586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1589:	6a 01                	push   $0x1
    158b:	57                   	push   %edi
    158c:	53                   	push   %ebx
    158d:	e8 01 fd ff ff       	call   1293 <write>
        while(*s != 0){
    1592:	0f b6 06             	movzbl (%esi),%eax
    1595:	83 c4 10             	add    $0x10,%esp
    1598:	84 c0                	test   %al,%al
    159a:	75 e4                	jne    1580 <printf+0x1a0>
    159c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    159f:	31 d2                	xor    %edx,%edx
    15a1:	e9 8e fe ff ff       	jmp    1434 <printf+0x54>
    15a6:	66 90                	xchg   %ax,%ax
    15a8:	66 90                	xchg   %ax,%ax
    15aa:	66 90                	xchg   %ax,%ax
    15ac:	66 90                	xchg   %ax,%ax
    15ae:	66 90                	xchg   %ax,%ax

000015b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b0:	f3 0f 1e fb          	endbr32 
    15b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b5:	a1 68 1a 00 00       	mov    0x1a68,%eax
{
    15ba:	89 e5                	mov    %esp,%ebp
    15bc:	57                   	push   %edi
    15bd:	56                   	push   %esi
    15be:	53                   	push   %ebx
    15bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    15c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c7:	39 c8                	cmp    %ecx,%eax
    15c9:	73 15                	jae    15e0 <free+0x30>
    15cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
    15d0:	39 d1                	cmp    %edx,%ecx
    15d2:	72 14                	jb     15e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15d4:	39 d0                	cmp    %edx,%eax
    15d6:	73 10                	jae    15e8 <free+0x38>
{
    15d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15da:	8b 10                	mov    (%eax),%edx
    15dc:	39 c8                	cmp    %ecx,%eax
    15de:	72 f0                	jb     15d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15e0:	39 d0                	cmp    %edx,%eax
    15e2:	72 f4                	jb     15d8 <free+0x28>
    15e4:	39 d1                	cmp    %edx,%ecx
    15e6:	73 f0                	jae    15d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    15ee:	39 fa                	cmp    %edi,%edx
    15f0:	74 1e                	je     1610 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15f5:	8b 50 04             	mov    0x4(%eax),%edx
    15f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    15fb:	39 f1                	cmp    %esi,%ecx
    15fd:	74 28                	je     1627 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1601:	5b                   	pop    %ebx
  freep = p;
    1602:	a3 68 1a 00 00       	mov    %eax,0x1a68
}
    1607:	5e                   	pop    %esi
    1608:	5f                   	pop    %edi
    1609:	5d                   	pop    %ebp
    160a:	c3                   	ret    
    160b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    160f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1610:	03 72 04             	add    0x4(%edx),%esi
    1613:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1616:	8b 10                	mov    (%eax),%edx
    1618:	8b 12                	mov    (%edx),%edx
    161a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    161d:	8b 50 04             	mov    0x4(%eax),%edx
    1620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1623:	39 f1                	cmp    %esi,%ecx
    1625:	75 d8                	jne    15ff <free+0x4f>
    p->s.size += bp->s.size;
    1627:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    162a:	a3 68 1a 00 00       	mov    %eax,0x1a68
    p->s.size += bp->s.size;
    162f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1632:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1635:	89 10                	mov    %edx,(%eax)
}
    1637:	5b                   	pop    %ebx
    1638:	5e                   	pop    %esi
    1639:	5f                   	pop    %edi
    163a:	5d                   	pop    %ebp
    163b:	c3                   	ret    
    163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1640:	f3 0f 1e fb          	endbr32 
    1644:	55                   	push   %ebp
    1645:	89 e5                	mov    %esp,%ebp
    1647:	57                   	push   %edi
    1648:	56                   	push   %esi
    1649:	53                   	push   %ebx
    164a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    164d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1650:	8b 3d 68 1a 00 00    	mov    0x1a68,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1656:	8d 70 07             	lea    0x7(%eax),%esi
    1659:	c1 ee 03             	shr    $0x3,%esi
    165c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    165f:	85 ff                	test   %edi,%edi
    1661:	0f 84 a9 00 00 00    	je     1710 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1667:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1669:	8b 48 04             	mov    0x4(%eax),%ecx
    166c:	39 f1                	cmp    %esi,%ecx
    166e:	73 6d                	jae    16dd <malloc+0x9d>
    1670:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1676:	bb 00 10 00 00       	mov    $0x1000,%ebx
    167b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    167e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1685:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1688:	eb 17                	jmp    16a1 <malloc+0x61>
    168a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1690:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1692:	8b 4a 04             	mov    0x4(%edx),%ecx
    1695:	39 f1                	cmp    %esi,%ecx
    1697:	73 4f                	jae    16e8 <malloc+0xa8>
    1699:	8b 3d 68 1a 00 00    	mov    0x1a68,%edi
    169f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16a1:	39 c7                	cmp    %eax,%edi
    16a3:	75 eb                	jne    1690 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16a5:	83 ec 0c             	sub    $0xc,%esp
    16a8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16ab:	e8 4b fc ff ff       	call   12fb <sbrk>
  if(p == (char*)-1)
    16b0:	83 c4 10             	add    $0x10,%esp
    16b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    16b6:	74 1b                	je     16d3 <malloc+0x93>
  hp->s.size = nu;
    16b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16bb:	83 ec 0c             	sub    $0xc,%esp
    16be:	83 c0 08             	add    $0x8,%eax
    16c1:	50                   	push   %eax
    16c2:	e8 e9 fe ff ff       	call   15b0 <free>
  return freep;
    16c7:	a1 68 1a 00 00       	mov    0x1a68,%eax
      if((p = morecore(nunits)) == 0)
    16cc:	83 c4 10             	add    $0x10,%esp
    16cf:	85 c0                	test   %eax,%eax
    16d1:	75 bd                	jne    1690 <malloc+0x50>
        return 0;
  }
}
    16d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16d6:	31 c0                	xor    %eax,%eax
}
    16d8:	5b                   	pop    %ebx
    16d9:	5e                   	pop    %esi
    16da:	5f                   	pop    %edi
    16db:	5d                   	pop    %ebp
    16dc:	c3                   	ret    
    if(p->s.size >= nunits){
    16dd:	89 c2                	mov    %eax,%edx
    16df:	89 f8                	mov    %edi,%eax
    16e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16e8:	39 ce                	cmp    %ecx,%esi
    16ea:	74 54                	je     1740 <malloc+0x100>
        p->s.size -= nunits;
    16ec:	29 f1                	sub    %esi,%ecx
    16ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    16f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    16f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    16f7:	a3 68 1a 00 00       	mov    %eax,0x1a68
}
    16fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    16ff:	8d 42 08             	lea    0x8(%edx),%eax
}
    1702:	5b                   	pop    %ebx
    1703:	5e                   	pop    %esi
    1704:	5f                   	pop    %edi
    1705:	5d                   	pop    %ebp
    1706:	c3                   	ret    
    1707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    170e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1710:	c7 05 68 1a 00 00 6c 	movl   $0x1a6c,0x1a68
    1717:	1a 00 00 
    base.s.size = 0;
    171a:	bf 6c 1a 00 00       	mov    $0x1a6c,%edi
    base.s.ptr = freep = prevp = &base;
    171f:	c7 05 6c 1a 00 00 6c 	movl   $0x1a6c,0x1a6c
    1726:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1729:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    172b:	c7 05 70 1a 00 00 00 	movl   $0x0,0x1a70
    1732:	00 00 00 
    if(p->s.size >= nunits){
    1735:	e9 36 ff ff ff       	jmp    1670 <malloc+0x30>
    173a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1740:	8b 0a                	mov    (%edx),%ecx
    1742:	89 08                	mov    %ecx,(%eax)
    1744:	eb b1                	jmp    16f7 <malloc+0xb7>
    1746:	66 90                	xchg   %ax,%ax
    1748:	66 90                	xchg   %ax,%ax
    174a:	66 90                	xchg   %ax,%ax
    174c:	66 90                	xchg   %ax,%ax
    174e:	66 90                	xchg   %ax,%ax

00001750 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1750:	f3 0f 1e fb          	endbr32 
    1754:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1755:	b9 01 00 00 00       	mov    $0x1,%ecx
    175a:	89 e5                	mov    %esp,%ebp
    175c:	8b 55 08             	mov    0x8(%ebp),%edx
    175f:	90                   	nop
    1760:	89 c8                	mov    %ecx,%eax
    1762:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1765:	85 c0                	test   %eax,%eax
    1767:	75 f7                	jne    1760 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1769:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    176e:	5d                   	pop    %ebp
    176f:	c3                   	ret    

00001770 <urelease>:

void urelease (struct uspinlock *lk) {
    1770:	f3 0f 1e fb          	endbr32 
    1774:	55                   	push   %ebp
    1775:	89 e5                	mov    %esp,%ebp
    1777:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    177a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    177f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1785:	5d                   	pop    %ebp
    1786:	c3                   	ret    
