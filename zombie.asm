
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	51                   	push   %ecx
    1012:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
    1015:	e8 71 02 00 00       	call   128b <fork>
    101a:	85 c0                	test   %eax,%eax
    101c:	7e 0d                	jle    102b <main+0x2b>
    sleep(5);  // Let child exit before parent.
    101e:	83 ec 0c             	sub    $0xc,%esp
    1021:	6a 05                	push   $0x5
    1023:	e8 fb 02 00 00       	call   1323 <sleep>
    1028:	83 c4 10             	add    $0x10,%esp
  exit();
    102b:	e8 63 02 00 00       	call   1293 <exit>

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1030:	f3 0f 1e fb          	endbr32 
    1034:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1035:	31 c0                	xor    %eax,%eax
{
    1037:	89 e5                	mov    %esp,%ebp
    1039:	53                   	push   %ebx
    103a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    103d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1040:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1044:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1047:	83 c0 01             	add    $0x1,%eax
    104a:	84 d2                	test   %dl,%dl
    104c:	75 f2                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    104e:	89 c8                	mov    %ecx,%eax
    1050:	5b                   	pop    %ebx
    1051:	5d                   	pop    %ebp
    1052:	c3                   	ret    
    1053:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	f3 0f 1e fb          	endbr32 
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	53                   	push   %ebx
    1068:	8b 4d 08             	mov    0x8(%ebp),%ecx
    106b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    106e:	0f b6 01             	movzbl (%ecx),%eax
    1071:	0f b6 1a             	movzbl (%edx),%ebx
    1074:	84 c0                	test   %al,%al
    1076:	75 19                	jne    1091 <strcmp+0x31>
    1078:	eb 26                	jmp    10a0 <strcmp+0x40>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1080:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1084:	83 c1 01             	add    $0x1,%ecx
    1087:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    108a:	0f b6 1a             	movzbl (%edx),%ebx
    108d:	84 c0                	test   %al,%al
    108f:	74 0f                	je     10a0 <strcmp+0x40>
    1091:	38 d8                	cmp    %bl,%al
    1093:	74 eb                	je     1080 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1095:	29 d8                	sub    %ebx,%eax
}
    1097:	5b                   	pop    %ebx
    1098:	5d                   	pop    %ebp
    1099:	c3                   	ret    
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10a0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10a2:	29 d8                	sub    %ebx,%eax
}
    10a4:	5b                   	pop    %ebx
    10a5:	5d                   	pop    %ebp
    10a6:	c3                   	ret    
    10a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ae:	66 90                	xchg   %ax,%ax

000010b0 <strlen>:

uint
strlen(char *s)
{
    10b0:	f3 0f 1e fb          	endbr32 
    10b4:	55                   	push   %ebp
    10b5:	89 e5                	mov    %esp,%ebp
    10b7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10ba:	80 3a 00             	cmpb   $0x0,(%edx)
    10bd:	74 21                	je     10e0 <strlen+0x30>
    10bf:	31 c0                	xor    %eax,%eax
    10c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10c8:	83 c0 01             	add    $0x1,%eax
    10cb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10cf:	89 c1                	mov    %eax,%ecx
    10d1:	75 f5                	jne    10c8 <strlen+0x18>
    ;
  return n;
}
    10d3:	89 c8                	mov    %ecx,%eax
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10de:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    10e0:	31 c9                	xor    %ecx,%ecx
}
    10e2:	5d                   	pop    %ebp
    10e3:	89 c8                	mov    %ecx,%eax
    10e5:	c3                   	ret    
    10e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ed:	8d 76 00             	lea    0x0(%esi),%esi

000010f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10f0:	f3 0f 1e fb          	endbr32 
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	57                   	push   %edi
    10f8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1101:	89 d7                	mov    %edx,%edi
    1103:	fc                   	cld    
    1104:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1106:	89 d0                	mov    %edx,%eax
    1108:	5f                   	pop    %edi
    1109:	5d                   	pop    %ebp
    110a:	c3                   	ret    
    110b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    110f:	90                   	nop

00001110 <strchr>:

char*
strchr(const char *s, char c)
{
    1110:	f3 0f 1e fb          	endbr32 
    1114:	55                   	push   %ebp
    1115:	89 e5                	mov    %esp,%ebp
    1117:	8b 45 08             	mov    0x8(%ebp),%eax
    111a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    111e:	0f b6 10             	movzbl (%eax),%edx
    1121:	84 d2                	test   %dl,%dl
    1123:	75 16                	jne    113b <strchr+0x2b>
    1125:	eb 21                	jmp    1148 <strchr+0x38>
    1127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112e:	66 90                	xchg   %ax,%ax
    1130:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1134:	83 c0 01             	add    $0x1,%eax
    1137:	84 d2                	test   %dl,%dl
    1139:	74 0d                	je     1148 <strchr+0x38>
    if(*s == c)
    113b:	38 d1                	cmp    %dl,%cl
    113d:	75 f1                	jne    1130 <strchr+0x20>
      return (char*)s;
  return 0;
}
    113f:	5d                   	pop    %ebp
    1140:	c3                   	ret    
    1141:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1148:	31 c0                	xor    %eax,%eax
}
    114a:	5d                   	pop    %ebp
    114b:	c3                   	ret    
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001150 <gets>:

char*
gets(char *buf, int max)
{
    1150:	f3 0f 1e fb          	endbr32 
    1154:	55                   	push   %ebp
    1155:	89 e5                	mov    %esp,%ebp
    1157:	57                   	push   %edi
    1158:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1159:	31 f6                	xor    %esi,%esi
{
    115b:	53                   	push   %ebx
    115c:	89 f3                	mov    %esi,%ebx
    115e:	83 ec 1c             	sub    $0x1c,%esp
    1161:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1164:	eb 33                	jmp    1199 <gets+0x49>
    1166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1170:	83 ec 04             	sub    $0x4,%esp
    1173:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1176:	6a 01                	push   $0x1
    1178:	50                   	push   %eax
    1179:	6a 00                	push   $0x0
    117b:	e8 2b 01 00 00       	call   12ab <read>
    if(cc < 1)
    1180:	83 c4 10             	add    $0x10,%esp
    1183:	85 c0                	test   %eax,%eax
    1185:	7e 1c                	jle    11a3 <gets+0x53>
      break;
    buf[i++] = c;
    1187:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    118b:	83 c7 01             	add    $0x1,%edi
    118e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1191:	3c 0a                	cmp    $0xa,%al
    1193:	74 23                	je     11b8 <gets+0x68>
    1195:	3c 0d                	cmp    $0xd,%al
    1197:	74 1f                	je     11b8 <gets+0x68>
  for(i=0; i+1 < max; ){
    1199:	83 c3 01             	add    $0x1,%ebx
    119c:	89 fe                	mov    %edi,%esi
    119e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11a1:	7c cd                	jl     1170 <gets+0x20>
    11a3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11a5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11a8:	c6 03 00             	movb   $0x0,(%ebx)
}
    11ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ae:	5b                   	pop    %ebx
    11af:	5e                   	pop    %esi
    11b0:	5f                   	pop    %edi
    11b1:	5d                   	pop    %ebp
    11b2:	c3                   	ret    
    11b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b7:	90                   	nop
    11b8:	8b 75 08             	mov    0x8(%ebp),%esi
    11bb:	8b 45 08             	mov    0x8(%ebp),%eax
    11be:	01 de                	add    %ebx,%esi
    11c0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11c2:	c6 03 00             	movb   $0x0,(%ebx)
}
    11c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11c8:	5b                   	pop    %ebx
    11c9:	5e                   	pop    %esi
    11ca:	5f                   	pop    %edi
    11cb:	5d                   	pop    %ebp
    11cc:	c3                   	ret    
    11cd:	8d 76 00             	lea    0x0(%esi),%esi

000011d0 <stat>:

int
stat(char *n, struct stat *st)
{
    11d0:	f3 0f 1e fb          	endbr32 
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
    11d7:	56                   	push   %esi
    11d8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11d9:	83 ec 08             	sub    $0x8,%esp
    11dc:	6a 00                	push   $0x0
    11de:	ff 75 08             	pushl  0x8(%ebp)
    11e1:	e8 ed 00 00 00       	call   12d3 <open>
  if(fd < 0)
    11e6:	83 c4 10             	add    $0x10,%esp
    11e9:	85 c0                	test   %eax,%eax
    11eb:	78 2b                	js     1218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11ed:	83 ec 08             	sub    $0x8,%esp
    11f0:	ff 75 0c             	pushl  0xc(%ebp)
    11f3:	89 c3                	mov    %eax,%ebx
    11f5:	50                   	push   %eax
    11f6:	e8 f0 00 00 00       	call   12eb <fstat>
  close(fd);
    11fb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    11fe:	89 c6                	mov    %eax,%esi
  close(fd);
    1200:	e8 b6 00 00 00       	call   12bb <close>
  return r;
    1205:	83 c4 10             	add    $0x10,%esp
}
    1208:	8d 65 f8             	lea    -0x8(%ebp),%esp
    120b:	89 f0                	mov    %esi,%eax
    120d:	5b                   	pop    %ebx
    120e:	5e                   	pop    %esi
    120f:	5d                   	pop    %ebp
    1210:	c3                   	ret    
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1218:	be ff ff ff ff       	mov    $0xffffffff,%esi
    121d:	eb e9                	jmp    1208 <stat+0x38>
    121f:	90                   	nop

00001220 <atoi>:

int
atoi(const char *s)
{
    1220:	f3 0f 1e fb          	endbr32 
    1224:	55                   	push   %ebp
    1225:	89 e5                	mov    %esp,%ebp
    1227:	53                   	push   %ebx
    1228:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    122b:	0f be 02             	movsbl (%edx),%eax
    122e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1231:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1234:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1239:	77 1a                	ja     1255 <atoi+0x35>
    123b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    123f:	90                   	nop
    n = n*10 + *s++ - '0';
    1240:	83 c2 01             	add    $0x1,%edx
    1243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    124a:	0f be 02             	movsbl (%edx),%eax
    124d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1250:	80 fb 09             	cmp    $0x9,%bl
    1253:	76 eb                	jbe    1240 <atoi+0x20>
  return n;
}
    1255:	89 c8                	mov    %ecx,%eax
    1257:	5b                   	pop    %ebx
    1258:	5d                   	pop    %ebp
    1259:	c3                   	ret    
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001260 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1260:	f3 0f 1e fb          	endbr32 
    1264:	55                   	push   %ebp
    1265:	89 e5                	mov    %esp,%ebp
    1267:	57                   	push   %edi
    1268:	8b 45 10             	mov    0x10(%ebp),%eax
    126b:	8b 55 08             	mov    0x8(%ebp),%edx
    126e:	56                   	push   %esi
    126f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1272:	85 c0                	test   %eax,%eax
    1274:	7e 0f                	jle    1285 <memmove+0x25>
    1276:	01 d0                	add    %edx,%eax
  dst = vdst;
    1278:	89 d7                	mov    %edx,%edi
    127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1281:	39 f8                	cmp    %edi,%eax
    1283:	75 fb                	jne    1280 <memmove+0x20>
  return vdst;
}
    1285:	5e                   	pop    %esi
    1286:	89 d0                	mov    %edx,%eax
    1288:	5f                   	pop    %edi
    1289:	5d                   	pop    %ebp
    128a:	c3                   	ret    

0000128b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    128b:	b8 01 00 00 00       	mov    $0x1,%eax
    1290:	cd 40                	int    $0x40
    1292:	c3                   	ret    

00001293 <exit>:
SYSCALL(exit)
    1293:	b8 02 00 00 00       	mov    $0x2,%eax
    1298:	cd 40                	int    $0x40
    129a:	c3                   	ret    

0000129b <wait>:
SYSCALL(wait)
    129b:	b8 03 00 00 00       	mov    $0x3,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <pipe>:
SYSCALL(pipe)
    12a3:	b8 04 00 00 00       	mov    $0x4,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <read>:
SYSCALL(read)
    12ab:	b8 05 00 00 00       	mov    $0x5,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <write>:
SYSCALL(write)
    12b3:	b8 10 00 00 00       	mov    $0x10,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <close>:
SYSCALL(close)
    12bb:	b8 15 00 00 00       	mov    $0x15,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <kill>:
SYSCALL(kill)
    12c3:	b8 06 00 00 00       	mov    $0x6,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <exec>:
SYSCALL(exec)
    12cb:	b8 07 00 00 00       	mov    $0x7,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <open>:
SYSCALL(open)
    12d3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <mknod>:
SYSCALL(mknod)
    12db:	b8 11 00 00 00       	mov    $0x11,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <unlink>:
SYSCALL(unlink)
    12e3:	b8 12 00 00 00       	mov    $0x12,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <fstat>:
SYSCALL(fstat)
    12eb:	b8 08 00 00 00       	mov    $0x8,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <link>:
SYSCALL(link)
    12f3:	b8 13 00 00 00       	mov    $0x13,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <mkdir>:
SYSCALL(mkdir)
    12fb:	b8 14 00 00 00       	mov    $0x14,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <chdir>:
SYSCALL(chdir)
    1303:	b8 09 00 00 00       	mov    $0x9,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <dup>:
SYSCALL(dup)
    130b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <getpid>:
SYSCALL(getpid)
    1313:	b8 0b 00 00 00       	mov    $0xb,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <sbrk>:
SYSCALL(sbrk)
    131b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <sleep>:
SYSCALL(sleep)
    1323:	b8 0d 00 00 00       	mov    $0xd,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <uptime>:
SYSCALL(uptime)
    132b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <shm_open>:
SYSCALL(shm_open)
    1333:	b8 16 00 00 00       	mov    $0x16,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <shm_close>:
SYSCALL(shm_close)	
    133b:	b8 17 00 00 00       	mov    $0x17,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    
    1343:	66 90                	xchg   %ax,%ax
    1345:	66 90                	xchg   %ax,%ax
    1347:	66 90                	xchg   %ax,%ax
    1349:	66 90                	xchg   %ax,%ax
    134b:	66 90                	xchg   %ax,%ax
    134d:	66 90                	xchg   %ax,%ax
    134f:	90                   	nop

00001350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 3c             	sub    $0x3c,%esp
    1359:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    135c:	89 d1                	mov    %edx,%ecx
{
    135e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1361:	85 d2                	test   %edx,%edx
    1363:	0f 89 7f 00 00 00    	jns    13e8 <printint+0x98>
    1369:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    136d:	74 79                	je     13e8 <printint+0x98>
    neg = 1;
    136f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1376:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1378:	31 db                	xor    %ebx,%ebx
    137a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    137d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1380:	89 c8                	mov    %ecx,%eax
    1382:	31 d2                	xor    %edx,%edx
    1384:	89 cf                	mov    %ecx,%edi
    1386:	f7 75 c4             	divl   -0x3c(%ebp)
    1389:	0f b6 92 b0 17 00 00 	movzbl 0x17b0(%edx),%edx
    1390:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1393:	89 d8                	mov    %ebx,%eax
    1395:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1398:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    139b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    139e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13a1:	76 dd                	jbe    1380 <printint+0x30>
  if(neg)
    13a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13a6:	85 c9                	test   %ecx,%ecx
    13a8:	74 0c                	je     13b6 <printint+0x66>
    buf[i++] = '-';
    13aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13bd:	eb 07                	jmp    13c6 <printint+0x76>
    13bf:	90                   	nop
    13c0:	0f b6 13             	movzbl (%ebx),%edx
    13c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13c6:	83 ec 04             	sub    $0x4,%esp
    13c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13cc:	6a 01                	push   $0x1
    13ce:	56                   	push   %esi
    13cf:	57                   	push   %edi
    13d0:	e8 de fe ff ff       	call   12b3 <write>
  while(--i >= 0)
    13d5:	83 c4 10             	add    $0x10,%esp
    13d8:	39 de                	cmp    %ebx,%esi
    13da:	75 e4                	jne    13c0 <printint+0x70>
    putc(fd, buf[i]);
}
    13dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13df:	5b                   	pop    %ebx
    13e0:	5e                   	pop    %esi
    13e1:	5f                   	pop    %edi
    13e2:	5d                   	pop    %ebp
    13e3:	c3                   	ret    
    13e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13ef:	eb 87                	jmp    1378 <printint+0x28>
    13f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ff:	90                   	nop

00001400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1400:	f3 0f 1e fb          	endbr32 
    1404:	55                   	push   %ebp
    1405:	89 e5                	mov    %esp,%ebp
    1407:	57                   	push   %edi
    1408:	56                   	push   %esi
    1409:	53                   	push   %ebx
    140a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    140d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1410:	0f b6 1e             	movzbl (%esi),%ebx
    1413:	84 db                	test   %bl,%bl
    1415:	0f 84 b4 00 00 00    	je     14cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    141b:	8d 45 10             	lea    0x10(%ebp),%eax
    141e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1421:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1424:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1426:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1429:	eb 33                	jmp    145e <printf+0x5e>
    142b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    142f:	90                   	nop
    1430:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1433:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1438:	83 f8 25             	cmp    $0x25,%eax
    143b:	74 17                	je     1454 <printf+0x54>
  write(fd, &c, 1);
    143d:	83 ec 04             	sub    $0x4,%esp
    1440:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1443:	6a 01                	push   $0x1
    1445:	57                   	push   %edi
    1446:	ff 75 08             	pushl  0x8(%ebp)
    1449:	e8 65 fe ff ff       	call   12b3 <write>
    144e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1451:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1454:	0f b6 1e             	movzbl (%esi),%ebx
    1457:	83 c6 01             	add    $0x1,%esi
    145a:	84 db                	test   %bl,%bl
    145c:	74 71                	je     14cf <printf+0xcf>
    c = fmt[i] & 0xff;
    145e:	0f be cb             	movsbl %bl,%ecx
    1461:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1464:	85 d2                	test   %edx,%edx
    1466:	74 c8                	je     1430 <printf+0x30>
      }
    } else if(state == '%'){
    1468:	83 fa 25             	cmp    $0x25,%edx
    146b:	75 e7                	jne    1454 <printf+0x54>
      if(c == 'd'){
    146d:	83 f8 64             	cmp    $0x64,%eax
    1470:	0f 84 9a 00 00 00    	je     1510 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1476:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    147c:	83 f9 70             	cmp    $0x70,%ecx
    147f:	74 5f                	je     14e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1481:	83 f8 73             	cmp    $0x73,%eax
    1484:	0f 84 d6 00 00 00    	je     1560 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    148a:	83 f8 63             	cmp    $0x63,%eax
    148d:	0f 84 8d 00 00 00    	je     1520 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1493:	83 f8 25             	cmp    $0x25,%eax
    1496:	0f 84 b4 00 00 00    	je     1550 <printf+0x150>
  write(fd, &c, 1);
    149c:	83 ec 04             	sub    $0x4,%esp
    149f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14a3:	6a 01                	push   $0x1
    14a5:	57                   	push   %edi
    14a6:	ff 75 08             	pushl  0x8(%ebp)
    14a9:	e8 05 fe ff ff       	call   12b3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14b1:	83 c4 0c             	add    $0xc,%esp
    14b4:	6a 01                	push   $0x1
    14b6:	83 c6 01             	add    $0x1,%esi
    14b9:	57                   	push   %edi
    14ba:	ff 75 08             	pushl  0x8(%ebp)
    14bd:	e8 f1 fd ff ff       	call   12b3 <write>
  for(i = 0; fmt[i]; i++){
    14c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14cb:	84 db                	test   %bl,%bl
    14cd:	75 8f                	jne    145e <printf+0x5e>
    }
  }
}
    14cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14d2:	5b                   	pop    %ebx
    14d3:	5e                   	pop    %esi
    14d4:	5f                   	pop    %edi
    14d5:	5d                   	pop    %ebp
    14d6:	c3                   	ret    
    14d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14e0:	83 ec 0c             	sub    $0xc,%esp
    14e3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14e8:	6a 00                	push   $0x0
    14ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14ed:	8b 45 08             	mov    0x8(%ebp),%eax
    14f0:	8b 13                	mov    (%ebx),%edx
    14f2:	e8 59 fe ff ff       	call   1350 <printint>
        ap++;
    14f7:	89 d8                	mov    %ebx,%eax
    14f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    14fc:	31 d2                	xor    %edx,%edx
        ap++;
    14fe:	83 c0 04             	add    $0x4,%eax
    1501:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1504:	e9 4b ff ff ff       	jmp    1454 <printf+0x54>
    1509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1510:	83 ec 0c             	sub    $0xc,%esp
    1513:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1518:	6a 01                	push   $0x1
    151a:	eb ce                	jmp    14ea <printf+0xea>
    151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1520:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1523:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1526:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1528:	6a 01                	push   $0x1
        ap++;
    152a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    152d:	57                   	push   %edi
    152e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1531:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1534:	e8 7a fd ff ff       	call   12b3 <write>
        ap++;
    1539:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    153c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    153f:	31 d2                	xor    %edx,%edx
    1541:	e9 0e ff ff ff       	jmp    1454 <printf+0x54>
    1546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    154d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1550:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1553:	83 ec 04             	sub    $0x4,%esp
    1556:	e9 59 ff ff ff       	jmp    14b4 <printf+0xb4>
    155b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    155f:	90                   	nop
        s = (char*)*ap;
    1560:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1563:	8b 18                	mov    (%eax),%ebx
        ap++;
    1565:	83 c0 04             	add    $0x4,%eax
    1568:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    156b:	85 db                	test   %ebx,%ebx
    156d:	74 17                	je     1586 <printf+0x186>
        while(*s != 0){
    156f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1572:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1574:	84 c0                	test   %al,%al
    1576:	0f 84 d8 fe ff ff    	je     1454 <printf+0x54>
    157c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    157f:	89 de                	mov    %ebx,%esi
    1581:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1584:	eb 1a                	jmp    15a0 <printf+0x1a0>
          s = "(null)";
    1586:	bb a8 17 00 00       	mov    $0x17a8,%ebx
        while(*s != 0){
    158b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    158e:	b8 28 00 00 00       	mov    $0x28,%eax
    1593:	89 de                	mov    %ebx,%esi
    1595:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop
  write(fd, &c, 1);
    15a0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15a3:	83 c6 01             	add    $0x1,%esi
    15a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15a9:	6a 01                	push   $0x1
    15ab:	57                   	push   %edi
    15ac:	53                   	push   %ebx
    15ad:	e8 01 fd ff ff       	call   12b3 <write>
        while(*s != 0){
    15b2:	0f b6 06             	movzbl (%esi),%eax
    15b5:	83 c4 10             	add    $0x10,%esp
    15b8:	84 c0                	test   %al,%al
    15ba:	75 e4                	jne    15a0 <printf+0x1a0>
    15bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15bf:	31 d2                	xor    %edx,%edx
    15c1:	e9 8e fe ff ff       	jmp    1454 <printf+0x54>
    15c6:	66 90                	xchg   %ax,%ax
    15c8:	66 90                	xchg   %ax,%ax
    15ca:	66 90                	xchg   %ax,%ax
    15cc:	66 90                	xchg   %ax,%ax
    15ce:	66 90                	xchg   %ax,%ax

000015d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d0:	f3 0f 1e fb          	endbr32 
    15d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d5:	a1 98 1a 00 00       	mov    0x1a98,%eax
{
    15da:	89 e5                	mov    %esp,%ebp
    15dc:	57                   	push   %edi
    15dd:	56                   	push   %esi
    15de:	53                   	push   %ebx
    15df:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    15e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e7:	39 c8                	cmp    %ecx,%eax
    15e9:	73 15                	jae    1600 <free+0x30>
    15eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15ef:	90                   	nop
    15f0:	39 d1                	cmp    %edx,%ecx
    15f2:	72 14                	jb     1608 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f4:	39 d0                	cmp    %edx,%eax
    15f6:	73 10                	jae    1608 <free+0x38>
{
    15f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15fa:	8b 10                	mov    (%eax),%edx
    15fc:	39 c8                	cmp    %ecx,%eax
    15fe:	72 f0                	jb     15f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1600:	39 d0                	cmp    %edx,%eax
    1602:	72 f4                	jb     15f8 <free+0x28>
    1604:	39 d1                	cmp    %edx,%ecx
    1606:	73 f0                	jae    15f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1608:	8b 73 fc             	mov    -0x4(%ebx),%esi
    160b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    160e:	39 fa                	cmp    %edi,%edx
    1610:	74 1e                	je     1630 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1612:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1615:	8b 50 04             	mov    0x4(%eax),%edx
    1618:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    161b:	39 f1                	cmp    %esi,%ecx
    161d:	74 28                	je     1647 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    161f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1621:	5b                   	pop    %ebx
  freep = p;
    1622:	a3 98 1a 00 00       	mov    %eax,0x1a98
}
    1627:	5e                   	pop    %esi
    1628:	5f                   	pop    %edi
    1629:	5d                   	pop    %ebp
    162a:	c3                   	ret    
    162b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1630:	03 72 04             	add    0x4(%edx),%esi
    1633:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1636:	8b 10                	mov    (%eax),%edx
    1638:	8b 12                	mov    (%edx),%edx
    163a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    163d:	8b 50 04             	mov    0x4(%eax),%edx
    1640:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1643:	39 f1                	cmp    %esi,%ecx
    1645:	75 d8                	jne    161f <free+0x4f>
    p->s.size += bp->s.size;
    1647:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    164a:	a3 98 1a 00 00       	mov    %eax,0x1a98
    p->s.size += bp->s.size;
    164f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1652:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1655:	89 10                	mov    %edx,(%eax)
}
    1657:	5b                   	pop    %ebx
    1658:	5e                   	pop    %esi
    1659:	5f                   	pop    %edi
    165a:	5d                   	pop    %ebp
    165b:	c3                   	ret    
    165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1660:	f3 0f 1e fb          	endbr32 
    1664:	55                   	push   %ebp
    1665:	89 e5                	mov    %esp,%ebp
    1667:	57                   	push   %edi
    1668:	56                   	push   %esi
    1669:	53                   	push   %ebx
    166a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    166d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1670:	8b 3d 98 1a 00 00    	mov    0x1a98,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1676:	8d 70 07             	lea    0x7(%eax),%esi
    1679:	c1 ee 03             	shr    $0x3,%esi
    167c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    167f:	85 ff                	test   %edi,%edi
    1681:	0f 84 a9 00 00 00    	je     1730 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1687:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1689:	8b 48 04             	mov    0x4(%eax),%ecx
    168c:	39 f1                	cmp    %esi,%ecx
    168e:	73 6d                	jae    16fd <malloc+0x9d>
    1690:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1696:	bb 00 10 00 00       	mov    $0x1000,%ebx
    169b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    169e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16a8:	eb 17                	jmp    16c1 <malloc+0x61>
    16aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16b2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16b5:	39 f1                	cmp    %esi,%ecx
    16b7:	73 4f                	jae    1708 <malloc+0xa8>
    16b9:	8b 3d 98 1a 00 00    	mov    0x1a98,%edi
    16bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16c1:	39 c7                	cmp    %eax,%edi
    16c3:	75 eb                	jne    16b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16c5:	83 ec 0c             	sub    $0xc,%esp
    16c8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16cb:	e8 4b fc ff ff       	call   131b <sbrk>
  if(p == (char*)-1)
    16d0:	83 c4 10             	add    $0x10,%esp
    16d3:	83 f8 ff             	cmp    $0xffffffff,%eax
    16d6:	74 1b                	je     16f3 <malloc+0x93>
  hp->s.size = nu;
    16d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16db:	83 ec 0c             	sub    $0xc,%esp
    16de:	83 c0 08             	add    $0x8,%eax
    16e1:	50                   	push   %eax
    16e2:	e8 e9 fe ff ff       	call   15d0 <free>
  return freep;
    16e7:	a1 98 1a 00 00       	mov    0x1a98,%eax
      if((p = morecore(nunits)) == 0)
    16ec:	83 c4 10             	add    $0x10,%esp
    16ef:	85 c0                	test   %eax,%eax
    16f1:	75 bd                	jne    16b0 <malloc+0x50>
        return 0;
  }
}
    16f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    16f6:	31 c0                	xor    %eax,%eax
}
    16f8:	5b                   	pop    %ebx
    16f9:	5e                   	pop    %esi
    16fa:	5f                   	pop    %edi
    16fb:	5d                   	pop    %ebp
    16fc:	c3                   	ret    
    if(p->s.size >= nunits){
    16fd:	89 c2                	mov    %eax,%edx
    16ff:	89 f8                	mov    %edi,%eax
    1701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1708:	39 ce                	cmp    %ecx,%esi
    170a:	74 54                	je     1760 <malloc+0x100>
        p->s.size -= nunits;
    170c:	29 f1                	sub    %esi,%ecx
    170e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1711:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1714:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1717:	a3 98 1a 00 00       	mov    %eax,0x1a98
}
    171c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    171f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1722:	5b                   	pop    %ebx
    1723:	5e                   	pop    %esi
    1724:	5f                   	pop    %edi
    1725:	5d                   	pop    %ebp
    1726:	c3                   	ret    
    1727:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    172e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1730:	c7 05 98 1a 00 00 9c 	movl   $0x1a9c,0x1a98
    1737:	1a 00 00 
    base.s.size = 0;
    173a:	bf 9c 1a 00 00       	mov    $0x1a9c,%edi
    base.s.ptr = freep = prevp = &base;
    173f:	c7 05 9c 1a 00 00 9c 	movl   $0x1a9c,0x1a9c
    1746:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1749:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    174b:	c7 05 a0 1a 00 00 00 	movl   $0x0,0x1aa0
    1752:	00 00 00 
    if(p->s.size >= nunits){
    1755:	e9 36 ff ff ff       	jmp    1690 <malloc+0x30>
    175a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1760:	8b 0a                	mov    (%edx),%ecx
    1762:	89 08                	mov    %ecx,(%eax)
    1764:	eb b1                	jmp    1717 <malloc+0xb7>
    1766:	66 90                	xchg   %ax,%ax
    1768:	66 90                	xchg   %ax,%ax
    176a:	66 90                	xchg   %ax,%ax
    176c:	66 90                	xchg   %ax,%ax
    176e:	66 90                	xchg   %ax,%ax

00001770 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1770:	f3 0f 1e fb          	endbr32 
    1774:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1775:	b9 01 00 00 00       	mov    $0x1,%ecx
    177a:	89 e5                	mov    %esp,%ebp
    177c:	8b 55 08             	mov    0x8(%ebp),%edx
    177f:	90                   	nop
    1780:	89 c8                	mov    %ecx,%eax
    1782:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1785:	85 c0                	test   %eax,%eax
    1787:	75 f7                	jne    1780 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1789:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    178e:	5d                   	pop    %ebp
    178f:	c3                   	ret    

00001790 <urelease>:

void urelease (struct uspinlock *lk) {
    1790:	f3 0f 1e fb          	endbr32 
    1794:	55                   	push   %ebp
    1795:	89 e5                	mov    %esp,%ebp
    1797:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    179a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    179f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17a5:	5d                   	pop    %ebp
    17a6:	c3                   	ret    
