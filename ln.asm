
_ln:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
    100e:	83 39 03             	cmpl   $0x3,(%ecx)
{
    1011:	55                   	push   %ebp
    1012:	89 e5                	mov    %esp,%ebp
    1014:	53                   	push   %ebx
    1015:	51                   	push   %ecx
    1016:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
    1019:	74 13                	je     102e <main+0x2e>
    printf(2, "Usage: ln old new\n");
    101b:	52                   	push   %edx
    101c:	52                   	push   %edx
    101d:	68 d8 17 00 00       	push   $0x17d8
    1022:	6a 02                	push   $0x2
    1024:	e8 07 04 00 00       	call   1430 <printf>
    exit();
    1029:	e8 95 02 00 00       	call   12c3 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    102e:	50                   	push   %eax
    102f:	50                   	push   %eax
    1030:	ff 73 08             	pushl  0x8(%ebx)
    1033:	ff 73 04             	pushl  0x4(%ebx)
    1036:	e8 e8 02 00 00       	call   1323 <link>
    103b:	83 c4 10             	add    $0x10,%esp
    103e:	85 c0                	test   %eax,%eax
    1040:	78 05                	js     1047 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
    1042:	e8 7c 02 00 00       	call   12c3 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1047:	ff 73 08             	pushl  0x8(%ebx)
    104a:	ff 73 04             	pushl  0x4(%ebx)
    104d:	68 eb 17 00 00       	push   $0x17eb
    1052:	6a 02                	push   $0x2
    1054:	e8 d7 03 00 00       	call   1430 <printf>
    1059:	83 c4 10             	add    $0x10,%esp
    105c:	eb e4                	jmp    1042 <main+0x42>
    105e:	66 90                	xchg   %ax,%ax

00001060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1060:	f3 0f 1e fb          	endbr32 
    1064:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1065:	31 c0                	xor    %eax,%eax
{
    1067:	89 e5                	mov    %esp,%ebp
    1069:	53                   	push   %ebx
    106a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    106d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1070:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1074:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1077:	83 c0 01             	add    $0x1,%eax
    107a:	84 d2                	test   %dl,%dl
    107c:	75 f2                	jne    1070 <strcpy+0x10>
    ;
  return os;
}
    107e:	89 c8                	mov    %ecx,%eax
    1080:	5b                   	pop    %ebx
    1081:	5d                   	pop    %ebp
    1082:	c3                   	ret    
    1083:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    108a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1090:	f3 0f 1e fb          	endbr32 
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
    1097:	53                   	push   %ebx
    1098:	8b 4d 08             	mov    0x8(%ebp),%ecx
    109b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    109e:	0f b6 01             	movzbl (%ecx),%eax
    10a1:	0f b6 1a             	movzbl (%edx),%ebx
    10a4:	84 c0                	test   %al,%al
    10a6:	75 19                	jne    10c1 <strcmp+0x31>
    10a8:	eb 26                	jmp    10d0 <strcmp+0x40>
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    10b4:	83 c1 01             	add    $0x1,%ecx
    10b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10ba:	0f b6 1a             	movzbl (%edx),%ebx
    10bd:	84 c0                	test   %al,%al
    10bf:	74 0f                	je     10d0 <strcmp+0x40>
    10c1:	38 d8                	cmp    %bl,%al
    10c3:	74 eb                	je     10b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10c5:	29 d8                	sub    %ebx,%eax
}
    10c7:	5b                   	pop    %ebx
    10c8:	5d                   	pop    %ebp
    10c9:	c3                   	ret    
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10d2:	29 d8                	sub    %ebx,%eax
}
    10d4:	5b                   	pop    %ebx
    10d5:	5d                   	pop    %ebp
    10d6:	c3                   	ret    
    10d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10de:	66 90                	xchg   %ax,%ax

000010e0 <strlen>:

uint
strlen(char *s)
{
    10e0:	f3 0f 1e fb          	endbr32 
    10e4:	55                   	push   %ebp
    10e5:	89 e5                	mov    %esp,%ebp
    10e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10ea:	80 3a 00             	cmpb   $0x0,(%edx)
    10ed:	74 21                	je     1110 <strlen+0x30>
    10ef:	31 c0                	xor    %eax,%eax
    10f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10f8:	83 c0 01             	add    $0x1,%eax
    10fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10ff:	89 c1                	mov    %eax,%ecx
    1101:	75 f5                	jne    10f8 <strlen+0x18>
    ;
  return n;
}
    1103:	89 c8                	mov    %ecx,%eax
    1105:	5d                   	pop    %ebp
    1106:	c3                   	ret    
    1107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    110e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1110:	31 c9                	xor    %ecx,%ecx
}
    1112:	5d                   	pop    %ebp
    1113:	89 c8                	mov    %ecx,%eax
    1115:	c3                   	ret    
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi

00001120 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1120:	f3 0f 1e fb          	endbr32 
    1124:	55                   	push   %ebp
    1125:	89 e5                	mov    %esp,%ebp
    1127:	57                   	push   %edi
    1128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    112b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    112e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1131:	89 d7                	mov    %edx,%edi
    1133:	fc                   	cld    
    1134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1136:	89 d0                	mov    %edx,%eax
    1138:	5f                   	pop    %edi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret    
    113b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    113f:	90                   	nop

00001140 <strchr>:

char*
strchr(const char *s, char c)
{
    1140:	f3 0f 1e fb          	endbr32 
    1144:	55                   	push   %ebp
    1145:	89 e5                	mov    %esp,%ebp
    1147:	8b 45 08             	mov    0x8(%ebp),%eax
    114a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    114e:	0f b6 10             	movzbl (%eax),%edx
    1151:	84 d2                	test   %dl,%dl
    1153:	75 16                	jne    116b <strchr+0x2b>
    1155:	eb 21                	jmp    1178 <strchr+0x38>
    1157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115e:	66 90                	xchg   %ax,%ax
    1160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1164:	83 c0 01             	add    $0x1,%eax
    1167:	84 d2                	test   %dl,%dl
    1169:	74 0d                	je     1178 <strchr+0x38>
    if(*s == c)
    116b:	38 d1                	cmp    %dl,%cl
    116d:	75 f1                	jne    1160 <strchr+0x20>
      return (char*)s;
  return 0;
}
    116f:	5d                   	pop    %ebp
    1170:	c3                   	ret    
    1171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1178:	31 c0                	xor    %eax,%eax
}
    117a:	5d                   	pop    %ebp
    117b:	c3                   	ret    
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001180 <gets>:

char*
gets(char *buf, int max)
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	57                   	push   %edi
    1188:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1189:	31 f6                	xor    %esi,%esi
{
    118b:	53                   	push   %ebx
    118c:	89 f3                	mov    %esi,%ebx
    118e:	83 ec 1c             	sub    $0x1c,%esp
    1191:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1194:	eb 33                	jmp    11c9 <gets+0x49>
    1196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11a0:	83 ec 04             	sub    $0x4,%esp
    11a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11a6:	6a 01                	push   $0x1
    11a8:	50                   	push   %eax
    11a9:	6a 00                	push   $0x0
    11ab:	e8 2b 01 00 00       	call   12db <read>
    if(cc < 1)
    11b0:	83 c4 10             	add    $0x10,%esp
    11b3:	85 c0                	test   %eax,%eax
    11b5:	7e 1c                	jle    11d3 <gets+0x53>
      break;
    buf[i++] = c;
    11b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11bb:	83 c7 01             	add    $0x1,%edi
    11be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11c1:	3c 0a                	cmp    $0xa,%al
    11c3:	74 23                	je     11e8 <gets+0x68>
    11c5:	3c 0d                	cmp    $0xd,%al
    11c7:	74 1f                	je     11e8 <gets+0x68>
  for(i=0; i+1 < max; ){
    11c9:	83 c3 01             	add    $0x1,%ebx
    11cc:	89 fe                	mov    %edi,%esi
    11ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11d1:	7c cd                	jl     11a0 <gets+0x20>
    11d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11d8:	c6 03 00             	movb   $0x0,(%ebx)
}
    11db:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11de:	5b                   	pop    %ebx
    11df:	5e                   	pop    %esi
    11e0:	5f                   	pop    %edi
    11e1:	5d                   	pop    %ebp
    11e2:	c3                   	ret    
    11e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11e7:	90                   	nop
    11e8:	8b 75 08             	mov    0x8(%ebp),%esi
    11eb:	8b 45 08             	mov    0x8(%ebp),%eax
    11ee:	01 de                	add    %ebx,%esi
    11f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11f2:	c6 03 00             	movb   $0x0,(%ebx)
}
    11f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11f8:	5b                   	pop    %ebx
    11f9:	5e                   	pop    %esi
    11fa:	5f                   	pop    %edi
    11fb:	5d                   	pop    %ebp
    11fc:	c3                   	ret    
    11fd:	8d 76 00             	lea    0x0(%esi),%esi

00001200 <stat>:

int
stat(char *n, struct stat *st)
{
    1200:	f3 0f 1e fb          	endbr32 
    1204:	55                   	push   %ebp
    1205:	89 e5                	mov    %esp,%ebp
    1207:	56                   	push   %esi
    1208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1209:	83 ec 08             	sub    $0x8,%esp
    120c:	6a 00                	push   $0x0
    120e:	ff 75 08             	pushl  0x8(%ebp)
    1211:	e8 ed 00 00 00       	call   1303 <open>
  if(fd < 0)
    1216:	83 c4 10             	add    $0x10,%esp
    1219:	85 c0                	test   %eax,%eax
    121b:	78 2b                	js     1248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    121d:	83 ec 08             	sub    $0x8,%esp
    1220:	ff 75 0c             	pushl  0xc(%ebp)
    1223:	89 c3                	mov    %eax,%ebx
    1225:	50                   	push   %eax
    1226:	e8 f0 00 00 00       	call   131b <fstat>
  close(fd);
    122b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    122e:	89 c6                	mov    %eax,%esi
  close(fd);
    1230:	e8 b6 00 00 00       	call   12eb <close>
  return r;
    1235:	83 c4 10             	add    $0x10,%esp
}
    1238:	8d 65 f8             	lea    -0x8(%ebp),%esp
    123b:	89 f0                	mov    %esi,%eax
    123d:	5b                   	pop    %ebx
    123e:	5e                   	pop    %esi
    123f:	5d                   	pop    %ebp
    1240:	c3                   	ret    
    1241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1248:	be ff ff ff ff       	mov    $0xffffffff,%esi
    124d:	eb e9                	jmp    1238 <stat+0x38>
    124f:	90                   	nop

00001250 <atoi>:

int
atoi(const char *s)
{
    1250:	f3 0f 1e fb          	endbr32 
    1254:	55                   	push   %ebp
    1255:	89 e5                	mov    %esp,%ebp
    1257:	53                   	push   %ebx
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    125b:	0f be 02             	movsbl (%edx),%eax
    125e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1261:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1264:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1269:	77 1a                	ja     1285 <atoi+0x35>
    126b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    126f:	90                   	nop
    n = n*10 + *s++ - '0';
    1270:	83 c2 01             	add    $0x1,%edx
    1273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    127a:	0f be 02             	movsbl (%edx),%eax
    127d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1280:	80 fb 09             	cmp    $0x9,%bl
    1283:	76 eb                	jbe    1270 <atoi+0x20>
  return n;
}
    1285:	89 c8                	mov    %ecx,%eax
    1287:	5b                   	pop    %ebx
    1288:	5d                   	pop    %ebp
    1289:	c3                   	ret    
    128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1290:	f3 0f 1e fb          	endbr32 
    1294:	55                   	push   %ebp
    1295:	89 e5                	mov    %esp,%ebp
    1297:	57                   	push   %edi
    1298:	8b 45 10             	mov    0x10(%ebp),%eax
    129b:	8b 55 08             	mov    0x8(%ebp),%edx
    129e:	56                   	push   %esi
    129f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12a2:	85 c0                	test   %eax,%eax
    12a4:	7e 0f                	jle    12b5 <memmove+0x25>
    12a6:	01 d0                	add    %edx,%eax
  dst = vdst;
    12a8:	89 d7                	mov    %edx,%edi
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12b1:	39 f8                	cmp    %edi,%eax
    12b3:	75 fb                	jne    12b0 <memmove+0x20>
  return vdst;
}
    12b5:	5e                   	pop    %esi
    12b6:	89 d0                	mov    %edx,%eax
    12b8:	5f                   	pop    %edi
    12b9:	5d                   	pop    %ebp
    12ba:	c3                   	ret    

000012bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12bb:	b8 01 00 00 00       	mov    $0x1,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <exit>:
SYSCALL(exit)
    12c3:	b8 02 00 00 00       	mov    $0x2,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <wait>:
SYSCALL(wait)
    12cb:	b8 03 00 00 00       	mov    $0x3,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <pipe>:
SYSCALL(pipe)
    12d3:	b8 04 00 00 00       	mov    $0x4,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <read>:
SYSCALL(read)
    12db:	b8 05 00 00 00       	mov    $0x5,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <write>:
SYSCALL(write)
    12e3:	b8 10 00 00 00       	mov    $0x10,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <close>:
SYSCALL(close)
    12eb:	b8 15 00 00 00       	mov    $0x15,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <kill>:
SYSCALL(kill)
    12f3:	b8 06 00 00 00       	mov    $0x6,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <exec>:
SYSCALL(exec)
    12fb:	b8 07 00 00 00       	mov    $0x7,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <open>:
SYSCALL(open)
    1303:	b8 0f 00 00 00       	mov    $0xf,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <mknod>:
SYSCALL(mknod)
    130b:	b8 11 00 00 00       	mov    $0x11,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <unlink>:
SYSCALL(unlink)
    1313:	b8 12 00 00 00       	mov    $0x12,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <fstat>:
SYSCALL(fstat)
    131b:	b8 08 00 00 00       	mov    $0x8,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <link>:
SYSCALL(link)
    1323:	b8 13 00 00 00       	mov    $0x13,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <mkdir>:
SYSCALL(mkdir)
    132b:	b8 14 00 00 00       	mov    $0x14,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <chdir>:
SYSCALL(chdir)
    1333:	b8 09 00 00 00       	mov    $0x9,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <dup>:
SYSCALL(dup)
    133b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <getpid>:
SYSCALL(getpid)
    1343:	b8 0b 00 00 00       	mov    $0xb,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <sbrk>:
SYSCALL(sbrk)
    134b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <sleep>:
SYSCALL(sleep)
    1353:	b8 0d 00 00 00       	mov    $0xd,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <uptime>:
SYSCALL(uptime)
    135b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <shm_open>:
SYSCALL(shm_open)
    1363:	b8 16 00 00 00       	mov    $0x16,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <shm_close>:
SYSCALL(shm_close)	
    136b:	b8 17 00 00 00       	mov    $0x17,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    
    1373:	66 90                	xchg   %ax,%ax
    1375:	66 90                	xchg   %ax,%ax
    1377:	66 90                	xchg   %ax,%ax
    1379:	66 90                	xchg   %ax,%ax
    137b:	66 90                	xchg   %ax,%ax
    137d:	66 90                	xchg   %ax,%ax
    137f:	90                   	nop

00001380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 3c             	sub    $0x3c,%esp
    1389:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    138c:	89 d1                	mov    %edx,%ecx
{
    138e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1391:	85 d2                	test   %edx,%edx
    1393:	0f 89 7f 00 00 00    	jns    1418 <printint+0x98>
    1399:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    139d:	74 79                	je     1418 <printint+0x98>
    neg = 1;
    139f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13a8:	31 db                	xor    %ebx,%ebx
    13aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13b0:	89 c8                	mov    %ecx,%eax
    13b2:	31 d2                	xor    %edx,%edx
    13b4:	89 cf                	mov    %ecx,%edi
    13b6:	f7 75 c4             	divl   -0x3c(%ebp)
    13b9:	0f b6 92 08 18 00 00 	movzbl 0x1808(%edx),%edx
    13c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13c3:	89 d8                	mov    %ebx,%eax
    13c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13d1:	76 dd                	jbe    13b0 <printint+0x30>
  if(neg)
    13d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13d6:	85 c9                	test   %ecx,%ecx
    13d8:	74 0c                	je     13e6 <printint+0x66>
    buf[i++] = '-';
    13da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13ed:	eb 07                	jmp    13f6 <printint+0x76>
    13ef:	90                   	nop
    13f0:	0f b6 13             	movzbl (%ebx),%edx
    13f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13f6:	83 ec 04             	sub    $0x4,%esp
    13f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13fc:	6a 01                	push   $0x1
    13fe:	56                   	push   %esi
    13ff:	57                   	push   %edi
    1400:	e8 de fe ff ff       	call   12e3 <write>
  while(--i >= 0)
    1405:	83 c4 10             	add    $0x10,%esp
    1408:	39 de                	cmp    %ebx,%esi
    140a:	75 e4                	jne    13f0 <printint+0x70>
    putc(fd, buf[i]);
}
    140c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    140f:	5b                   	pop    %ebx
    1410:	5e                   	pop    %esi
    1411:	5f                   	pop    %edi
    1412:	5d                   	pop    %ebp
    1413:	c3                   	ret    
    1414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1418:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    141f:	eb 87                	jmp    13a8 <printint+0x28>
    1421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    142f:	90                   	nop

00001430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1430:	f3 0f 1e fb          	endbr32 
    1434:	55                   	push   %ebp
    1435:	89 e5                	mov    %esp,%ebp
    1437:	57                   	push   %edi
    1438:	56                   	push   %esi
    1439:	53                   	push   %ebx
    143a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    143d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1440:	0f b6 1e             	movzbl (%esi),%ebx
    1443:	84 db                	test   %bl,%bl
    1445:	0f 84 b4 00 00 00    	je     14ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    144b:	8d 45 10             	lea    0x10(%ebp),%eax
    144e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1451:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1454:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1456:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1459:	eb 33                	jmp    148e <printf+0x5e>
    145b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    145f:	90                   	nop
    1460:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1463:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1468:	83 f8 25             	cmp    $0x25,%eax
    146b:	74 17                	je     1484 <printf+0x54>
  write(fd, &c, 1);
    146d:	83 ec 04             	sub    $0x4,%esp
    1470:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1473:	6a 01                	push   $0x1
    1475:	57                   	push   %edi
    1476:	ff 75 08             	pushl  0x8(%ebp)
    1479:	e8 65 fe ff ff       	call   12e3 <write>
    147e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1481:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1484:	0f b6 1e             	movzbl (%esi),%ebx
    1487:	83 c6 01             	add    $0x1,%esi
    148a:	84 db                	test   %bl,%bl
    148c:	74 71                	je     14ff <printf+0xcf>
    c = fmt[i] & 0xff;
    148e:	0f be cb             	movsbl %bl,%ecx
    1491:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1494:	85 d2                	test   %edx,%edx
    1496:	74 c8                	je     1460 <printf+0x30>
      }
    } else if(state == '%'){
    1498:	83 fa 25             	cmp    $0x25,%edx
    149b:	75 e7                	jne    1484 <printf+0x54>
      if(c == 'd'){
    149d:	83 f8 64             	cmp    $0x64,%eax
    14a0:	0f 84 9a 00 00 00    	je     1540 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14ac:	83 f9 70             	cmp    $0x70,%ecx
    14af:	74 5f                	je     1510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14b1:	83 f8 73             	cmp    $0x73,%eax
    14b4:	0f 84 d6 00 00 00    	je     1590 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ba:	83 f8 63             	cmp    $0x63,%eax
    14bd:	0f 84 8d 00 00 00    	je     1550 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14c3:	83 f8 25             	cmp    $0x25,%eax
    14c6:	0f 84 b4 00 00 00    	je     1580 <printf+0x150>
  write(fd, &c, 1);
    14cc:	83 ec 04             	sub    $0x4,%esp
    14cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14d3:	6a 01                	push   $0x1
    14d5:	57                   	push   %edi
    14d6:	ff 75 08             	pushl  0x8(%ebp)
    14d9:	e8 05 fe ff ff       	call   12e3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14e1:	83 c4 0c             	add    $0xc,%esp
    14e4:	6a 01                	push   $0x1
    14e6:	83 c6 01             	add    $0x1,%esi
    14e9:	57                   	push   %edi
    14ea:	ff 75 08             	pushl  0x8(%ebp)
    14ed:	e8 f1 fd ff ff       	call   12e3 <write>
  for(i = 0; fmt[i]; i++){
    14f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14fb:	84 db                	test   %bl,%bl
    14fd:	75 8f                	jne    148e <printf+0x5e>
    }
  }
}
    14ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1502:	5b                   	pop    %ebx
    1503:	5e                   	pop    %esi
    1504:	5f                   	pop    %edi
    1505:	5d                   	pop    %ebp
    1506:	c3                   	ret    
    1507:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    150e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1510:	83 ec 0c             	sub    $0xc,%esp
    1513:	b9 10 00 00 00       	mov    $0x10,%ecx
    1518:	6a 00                	push   $0x0
    151a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    151d:	8b 45 08             	mov    0x8(%ebp),%eax
    1520:	8b 13                	mov    (%ebx),%edx
    1522:	e8 59 fe ff ff       	call   1380 <printint>
        ap++;
    1527:	89 d8                	mov    %ebx,%eax
    1529:	83 c4 10             	add    $0x10,%esp
      state = 0;
    152c:	31 d2                	xor    %edx,%edx
        ap++;
    152e:	83 c0 04             	add    $0x4,%eax
    1531:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1534:	e9 4b ff ff ff       	jmp    1484 <printf+0x54>
    1539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1540:	83 ec 0c             	sub    $0xc,%esp
    1543:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1548:	6a 01                	push   $0x1
    154a:	eb ce                	jmp    151a <printf+0xea>
    154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1550:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1556:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1558:	6a 01                	push   $0x1
        ap++;
    155a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    155d:	57                   	push   %edi
    155e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1561:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1564:	e8 7a fd ff ff       	call   12e3 <write>
        ap++;
    1569:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    156c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    156f:	31 d2                	xor    %edx,%edx
    1571:	e9 0e ff ff ff       	jmp    1484 <printf+0x54>
    1576:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    157d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1580:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1583:	83 ec 04             	sub    $0x4,%esp
    1586:	e9 59 ff ff ff       	jmp    14e4 <printf+0xb4>
    158b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop
        s = (char*)*ap;
    1590:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1593:	8b 18                	mov    (%eax),%ebx
        ap++;
    1595:	83 c0 04             	add    $0x4,%eax
    1598:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    159b:	85 db                	test   %ebx,%ebx
    159d:	74 17                	je     15b6 <printf+0x186>
        while(*s != 0){
    159f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    15a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    15a4:	84 c0                	test   %al,%al
    15a6:	0f 84 d8 fe ff ff    	je     1484 <printf+0x54>
    15ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15af:	89 de                	mov    %ebx,%esi
    15b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15b4:	eb 1a                	jmp    15d0 <printf+0x1a0>
          s = "(null)";
    15b6:	bb ff 17 00 00       	mov    $0x17ff,%ebx
        while(*s != 0){
    15bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15be:	b8 28 00 00 00       	mov    $0x28,%eax
    15c3:	89 de                	mov    %ebx,%esi
    15c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15cf:	90                   	nop
  write(fd, &c, 1);
    15d0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15d3:	83 c6 01             	add    $0x1,%esi
    15d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15d9:	6a 01                	push   $0x1
    15db:	57                   	push   %edi
    15dc:	53                   	push   %ebx
    15dd:	e8 01 fd ff ff       	call   12e3 <write>
        while(*s != 0){
    15e2:	0f b6 06             	movzbl (%esi),%eax
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	84 c0                	test   %al,%al
    15ea:	75 e4                	jne    15d0 <printf+0x1a0>
    15ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15ef:	31 d2                	xor    %edx,%edx
    15f1:	e9 8e fe ff ff       	jmp    1484 <printf+0x54>
    15f6:	66 90                	xchg   %ax,%ax
    15f8:	66 90                	xchg   %ax,%ax
    15fa:	66 90                	xchg   %ax,%ax
    15fc:	66 90                	xchg   %ax,%ax
    15fe:	66 90                	xchg   %ax,%ax

00001600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1600:	f3 0f 1e fb          	endbr32 
    1604:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1605:	a1 f4 1a 00 00       	mov    0x1af4,%eax
{
    160a:	89 e5                	mov    %esp,%ebp
    160c:	57                   	push   %edi
    160d:	56                   	push   %esi
    160e:	53                   	push   %ebx
    160f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1612:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1614:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1617:	39 c8                	cmp    %ecx,%eax
    1619:	73 15                	jae    1630 <free+0x30>
    161b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    161f:	90                   	nop
    1620:	39 d1                	cmp    %edx,%ecx
    1622:	72 14                	jb     1638 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1624:	39 d0                	cmp    %edx,%eax
    1626:	73 10                	jae    1638 <free+0x38>
{
    1628:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    162a:	8b 10                	mov    (%eax),%edx
    162c:	39 c8                	cmp    %ecx,%eax
    162e:	72 f0                	jb     1620 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1630:	39 d0                	cmp    %edx,%eax
    1632:	72 f4                	jb     1628 <free+0x28>
    1634:	39 d1                	cmp    %edx,%ecx
    1636:	73 f0                	jae    1628 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1638:	8b 73 fc             	mov    -0x4(%ebx),%esi
    163b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    163e:	39 fa                	cmp    %edi,%edx
    1640:	74 1e                	je     1660 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1642:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1645:	8b 50 04             	mov    0x4(%eax),%edx
    1648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    164b:	39 f1                	cmp    %esi,%ecx
    164d:	74 28                	je     1677 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    164f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1651:	5b                   	pop    %ebx
  freep = p;
    1652:	a3 f4 1a 00 00       	mov    %eax,0x1af4
}
    1657:	5e                   	pop    %esi
    1658:	5f                   	pop    %edi
    1659:	5d                   	pop    %ebp
    165a:	c3                   	ret    
    165b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    165f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1660:	03 72 04             	add    0x4(%edx),%esi
    1663:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1666:	8b 10                	mov    (%eax),%edx
    1668:	8b 12                	mov    (%edx),%edx
    166a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    166d:	8b 50 04             	mov    0x4(%eax),%edx
    1670:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1673:	39 f1                	cmp    %esi,%ecx
    1675:	75 d8                	jne    164f <free+0x4f>
    p->s.size += bp->s.size;
    1677:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    167a:	a3 f4 1a 00 00       	mov    %eax,0x1af4
    p->s.size += bp->s.size;
    167f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1682:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1685:	89 10                	mov    %edx,(%eax)
}
    1687:	5b                   	pop    %ebx
    1688:	5e                   	pop    %esi
    1689:	5f                   	pop    %edi
    168a:	5d                   	pop    %ebp
    168b:	c3                   	ret    
    168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1690:	f3 0f 1e fb          	endbr32 
    1694:	55                   	push   %ebp
    1695:	89 e5                	mov    %esp,%ebp
    1697:	57                   	push   %edi
    1698:	56                   	push   %esi
    1699:	53                   	push   %ebx
    169a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    169d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16a0:	8b 3d f4 1a 00 00    	mov    0x1af4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16a6:	8d 70 07             	lea    0x7(%eax),%esi
    16a9:	c1 ee 03             	shr    $0x3,%esi
    16ac:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16af:	85 ff                	test   %edi,%edi
    16b1:	0f 84 a9 00 00 00    	je     1760 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16b7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    16b9:	8b 48 04             	mov    0x4(%eax),%ecx
    16bc:	39 f1                	cmp    %esi,%ecx
    16be:	73 6d                	jae    172d <malloc+0x9d>
    16c0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16c6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16cb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16ce:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16d5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16d8:	eb 17                	jmp    16f1 <malloc+0x61>
    16da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16e2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16e5:	39 f1                	cmp    %esi,%ecx
    16e7:	73 4f                	jae    1738 <malloc+0xa8>
    16e9:	8b 3d f4 1a 00 00    	mov    0x1af4,%edi
    16ef:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16f1:	39 c7                	cmp    %eax,%edi
    16f3:	75 eb                	jne    16e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16f5:	83 ec 0c             	sub    $0xc,%esp
    16f8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16fb:	e8 4b fc ff ff       	call   134b <sbrk>
  if(p == (char*)-1)
    1700:	83 c4 10             	add    $0x10,%esp
    1703:	83 f8 ff             	cmp    $0xffffffff,%eax
    1706:	74 1b                	je     1723 <malloc+0x93>
  hp->s.size = nu;
    1708:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    170b:	83 ec 0c             	sub    $0xc,%esp
    170e:	83 c0 08             	add    $0x8,%eax
    1711:	50                   	push   %eax
    1712:	e8 e9 fe ff ff       	call   1600 <free>
  return freep;
    1717:	a1 f4 1a 00 00       	mov    0x1af4,%eax
      if((p = morecore(nunits)) == 0)
    171c:	83 c4 10             	add    $0x10,%esp
    171f:	85 c0                	test   %eax,%eax
    1721:	75 bd                	jne    16e0 <malloc+0x50>
        return 0;
  }
}
    1723:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1726:	31 c0                	xor    %eax,%eax
}
    1728:	5b                   	pop    %ebx
    1729:	5e                   	pop    %esi
    172a:	5f                   	pop    %edi
    172b:	5d                   	pop    %ebp
    172c:	c3                   	ret    
    if(p->s.size >= nunits){
    172d:	89 c2                	mov    %eax,%edx
    172f:	89 f8                	mov    %edi,%eax
    1731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1738:	39 ce                	cmp    %ecx,%esi
    173a:	74 54                	je     1790 <malloc+0x100>
        p->s.size -= nunits;
    173c:	29 f1                	sub    %esi,%ecx
    173e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1741:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1744:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1747:	a3 f4 1a 00 00       	mov    %eax,0x1af4
}
    174c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    174f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1752:	5b                   	pop    %ebx
    1753:	5e                   	pop    %esi
    1754:	5f                   	pop    %edi
    1755:	5d                   	pop    %ebp
    1756:	c3                   	ret    
    1757:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    175e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1760:	c7 05 f4 1a 00 00 f8 	movl   $0x1af8,0x1af4
    1767:	1a 00 00 
    base.s.size = 0;
    176a:	bf f8 1a 00 00       	mov    $0x1af8,%edi
    base.s.ptr = freep = prevp = &base;
    176f:	c7 05 f8 1a 00 00 f8 	movl   $0x1af8,0x1af8
    1776:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1779:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    177b:	c7 05 fc 1a 00 00 00 	movl   $0x0,0x1afc
    1782:	00 00 00 
    if(p->s.size >= nunits){
    1785:	e9 36 ff ff ff       	jmp    16c0 <malloc+0x30>
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1790:	8b 0a                	mov    (%edx),%ecx
    1792:	89 08                	mov    %ecx,(%eax)
    1794:	eb b1                	jmp    1747 <malloc+0xb7>
    1796:	66 90                	xchg   %ax,%ax
    1798:	66 90                	xchg   %ax,%ax
    179a:	66 90                	xchg   %ax,%ax
    179c:	66 90                	xchg   %ax,%ax
    179e:	66 90                	xchg   %ax,%ax

000017a0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17a0:	f3 0f 1e fb          	endbr32 
    17a4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17a5:	b9 01 00 00 00       	mov    $0x1,%ecx
    17aa:	89 e5                	mov    %esp,%ebp
    17ac:	8b 55 08             	mov    0x8(%ebp),%edx
    17af:	90                   	nop
    17b0:	89 c8                	mov    %ecx,%eax
    17b2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17b5:	85 c0                	test   %eax,%eax
    17b7:	75 f7                	jne    17b0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17b9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17be:	5d                   	pop    %ebp
    17bf:	c3                   	ret    

000017c0 <urelease>:

void urelease (struct uspinlock *lk) {
    17c0:	f3 0f 1e fb          	endbr32 
    17c4:	55                   	push   %ebp
    17c5:	89 e5                	mov    %esp,%ebp
    17c7:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17ca:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17cf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17d5:	5d                   	pop    %ebp
    17d6:	c3                   	ret    
