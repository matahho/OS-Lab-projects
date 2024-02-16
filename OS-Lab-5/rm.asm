
_rm:     file format elf32-i386


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
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	57                   	push   %edi
    1012:	bf 01 00 00 00       	mov    $0x1,%edi
    1017:	56                   	push   %esi
    1018:	53                   	push   %ebx
    1019:	51                   	push   %ecx
    101a:	83 ec 08             	sub    $0x8,%esp
    101d:	8b 59 04             	mov    0x4(%ecx),%ebx
    1020:	8b 31                	mov    (%ecx),%esi
    1022:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
    1025:	83 fe 01             	cmp    $0x1,%esi
    1028:	7e 3a                	jle    1064 <main+0x64>
    102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	e8 f9 02 00 00       	call   1333 <unlink>
    103a:	83 c4 10             	add    $0x10,%esp
    103d:	85 c0                	test   %eax,%eax
    103f:	78 0f                	js     1050 <main+0x50>
  for(i = 1; i < argc; i++){
    1041:	83 c7 01             	add    $0x1,%edi
    1044:	83 c3 04             	add    $0x4,%ebx
    1047:	39 fe                	cmp    %edi,%esi
    1049:	75 e5                	jne    1030 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
    104b:	e8 93 02 00 00       	call   12e3 <exit>
      printf(2, "rm: %s failed to delete\n", argv[i]);
    1050:	50                   	push   %eax
    1051:	ff 33                	pushl  (%ebx)
    1053:	68 0c 18 00 00       	push   $0x180c
    1058:	6a 02                	push   $0x2
    105a:	e8 f1 03 00 00       	call   1450 <printf>
      break;
    105f:	83 c4 10             	add    $0x10,%esp
    1062:	eb e7                	jmp    104b <main+0x4b>
    printf(2, "Usage: rm files...\n");
    1064:	52                   	push   %edx
    1065:	52                   	push   %edx
    1066:	68 f8 17 00 00       	push   $0x17f8
    106b:	6a 02                	push   $0x2
    106d:	e8 de 03 00 00       	call   1450 <printf>
    exit();
    1072:	e8 6c 02 00 00       	call   12e3 <exit>
    1077:	66 90                	xchg   %ax,%ax
    1079:	66 90                	xchg   %ax,%ax
    107b:	66 90                	xchg   %ax,%ax
    107d:	66 90                	xchg   %ax,%ax
    107f:	90                   	nop

00001080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1080:	f3 0f 1e fb          	endbr32 
    1084:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1085:	31 c0                	xor    %eax,%eax
{
    1087:	89 e5                	mov    %esp,%ebp
    1089:	53                   	push   %ebx
    108a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    108d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1090:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1094:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1097:	83 c0 01             	add    $0x1,%eax
    109a:	84 d2                	test   %dl,%dl
    109c:	75 f2                	jne    1090 <strcpy+0x10>
    ;
  return os;
}
    109e:	89 c8                	mov    %ecx,%eax
    10a0:	5b                   	pop    %ebx
    10a1:	5d                   	pop    %ebp
    10a2:	c3                   	ret    
    10a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10b0:	f3 0f 1e fb          	endbr32 
    10b4:	55                   	push   %ebp
    10b5:	89 e5                	mov    %esp,%ebp
    10b7:	53                   	push   %ebx
    10b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    10be:	0f b6 01             	movzbl (%ecx),%eax
    10c1:	0f b6 1a             	movzbl (%edx),%ebx
    10c4:	84 c0                	test   %al,%al
    10c6:	75 19                	jne    10e1 <strcmp+0x31>
    10c8:	eb 26                	jmp    10f0 <strcmp+0x40>
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    10d4:	83 c1 01             	add    $0x1,%ecx
    10d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10da:	0f b6 1a             	movzbl (%edx),%ebx
    10dd:	84 c0                	test   %al,%al
    10df:	74 0f                	je     10f0 <strcmp+0x40>
    10e1:	38 d8                	cmp    %bl,%al
    10e3:	74 eb                	je     10d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10e5:	29 d8                	sub    %ebx,%eax
}
    10e7:	5b                   	pop    %ebx
    10e8:	5d                   	pop    %ebp
    10e9:	c3                   	ret    
    10ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10f2:	29 d8                	sub    %ebx,%eax
}
    10f4:	5b                   	pop    %ebx
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fe:	66 90                	xchg   %ax,%ax

00001100 <strlen>:

uint
strlen(char *s)
{
    1100:	f3 0f 1e fb          	endbr32 
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    110a:	80 3a 00             	cmpb   $0x0,(%edx)
    110d:	74 21                	je     1130 <strlen+0x30>
    110f:	31 c0                	xor    %eax,%eax
    1111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1118:	83 c0 01             	add    $0x1,%eax
    111b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    111f:	89 c1                	mov    %eax,%ecx
    1121:	75 f5                	jne    1118 <strlen+0x18>
    ;
  return n;
}
    1123:	89 c8                	mov    %ecx,%eax
    1125:	5d                   	pop    %ebp
    1126:	c3                   	ret    
    1127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1130:	31 c9                	xor    %ecx,%ecx
}
    1132:	5d                   	pop    %ebp
    1133:	89 c8                	mov    %ecx,%eax
    1135:	c3                   	ret    
    1136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113d:	8d 76 00             	lea    0x0(%esi),%esi

00001140 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1140:	f3 0f 1e fb          	endbr32 
    1144:	55                   	push   %ebp
    1145:	89 e5                	mov    %esp,%ebp
    1147:	57                   	push   %edi
    1148:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    114b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    114e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1151:	89 d7                	mov    %edx,%edi
    1153:	fc                   	cld    
    1154:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1156:	89 d0                	mov    %edx,%eax
    1158:	5f                   	pop    %edi
    1159:	5d                   	pop    %ebp
    115a:	c3                   	ret    
    115b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    115f:	90                   	nop

00001160 <strchr>:

char*
strchr(const char *s, char c)
{
    1160:	f3 0f 1e fb          	endbr32 
    1164:	55                   	push   %ebp
    1165:	89 e5                	mov    %esp,%ebp
    1167:	8b 45 08             	mov    0x8(%ebp),%eax
    116a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    116e:	0f b6 10             	movzbl (%eax),%edx
    1171:	84 d2                	test   %dl,%dl
    1173:	75 16                	jne    118b <strchr+0x2b>
    1175:	eb 21                	jmp    1198 <strchr+0x38>
    1177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117e:	66 90                	xchg   %ax,%ax
    1180:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1184:	83 c0 01             	add    $0x1,%eax
    1187:	84 d2                	test   %dl,%dl
    1189:	74 0d                	je     1198 <strchr+0x38>
    if(*s == c)
    118b:	38 d1                	cmp    %dl,%cl
    118d:	75 f1                	jne    1180 <strchr+0x20>
      return (char*)s;
  return 0;
}
    118f:	5d                   	pop    %ebp
    1190:	c3                   	ret    
    1191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1198:	31 c0                	xor    %eax,%eax
}
    119a:	5d                   	pop    %ebp
    119b:	c3                   	ret    
    119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011a0 <gets>:

char*
gets(char *buf, int max)
{
    11a0:	f3 0f 1e fb          	endbr32 
    11a4:	55                   	push   %ebp
    11a5:	89 e5                	mov    %esp,%ebp
    11a7:	57                   	push   %edi
    11a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a9:	31 f6                	xor    %esi,%esi
{
    11ab:	53                   	push   %ebx
    11ac:	89 f3                	mov    %esi,%ebx
    11ae:	83 ec 1c             	sub    $0x1c,%esp
    11b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11b4:	eb 33                	jmp    11e9 <gets+0x49>
    11b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11c0:	83 ec 04             	sub    $0x4,%esp
    11c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11c6:	6a 01                	push   $0x1
    11c8:	50                   	push   %eax
    11c9:	6a 00                	push   $0x0
    11cb:	e8 2b 01 00 00       	call   12fb <read>
    if(cc < 1)
    11d0:	83 c4 10             	add    $0x10,%esp
    11d3:	85 c0                	test   %eax,%eax
    11d5:	7e 1c                	jle    11f3 <gets+0x53>
      break;
    buf[i++] = c;
    11d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11db:	83 c7 01             	add    $0x1,%edi
    11de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11e1:	3c 0a                	cmp    $0xa,%al
    11e3:	74 23                	je     1208 <gets+0x68>
    11e5:	3c 0d                	cmp    $0xd,%al
    11e7:	74 1f                	je     1208 <gets+0x68>
  for(i=0; i+1 < max; ){
    11e9:	83 c3 01             	add    $0x1,%ebx
    11ec:	89 fe                	mov    %edi,%esi
    11ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11f1:	7c cd                	jl     11c0 <gets+0x20>
    11f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11f8:	c6 03 00             	movb   $0x0,(%ebx)
}
    11fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11fe:	5b                   	pop    %ebx
    11ff:	5e                   	pop    %esi
    1200:	5f                   	pop    %edi
    1201:	5d                   	pop    %ebp
    1202:	c3                   	ret    
    1203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1207:	90                   	nop
    1208:	8b 75 08             	mov    0x8(%ebp),%esi
    120b:	8b 45 08             	mov    0x8(%ebp),%eax
    120e:	01 de                	add    %ebx,%esi
    1210:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1212:	c6 03 00             	movb   $0x0,(%ebx)
}
    1215:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1218:	5b                   	pop    %ebx
    1219:	5e                   	pop    %esi
    121a:	5f                   	pop    %edi
    121b:	5d                   	pop    %ebp
    121c:	c3                   	ret    
    121d:	8d 76 00             	lea    0x0(%esi),%esi

00001220 <stat>:

int
stat(char *n, struct stat *st)
{
    1220:	f3 0f 1e fb          	endbr32 
    1224:	55                   	push   %ebp
    1225:	89 e5                	mov    %esp,%ebp
    1227:	56                   	push   %esi
    1228:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1229:	83 ec 08             	sub    $0x8,%esp
    122c:	6a 00                	push   $0x0
    122e:	ff 75 08             	pushl  0x8(%ebp)
    1231:	e8 ed 00 00 00       	call   1323 <open>
  if(fd < 0)
    1236:	83 c4 10             	add    $0x10,%esp
    1239:	85 c0                	test   %eax,%eax
    123b:	78 2b                	js     1268 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    123d:	83 ec 08             	sub    $0x8,%esp
    1240:	ff 75 0c             	pushl  0xc(%ebp)
    1243:	89 c3                	mov    %eax,%ebx
    1245:	50                   	push   %eax
    1246:	e8 f0 00 00 00       	call   133b <fstat>
  close(fd);
    124b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    124e:	89 c6                	mov    %eax,%esi
  close(fd);
    1250:	e8 b6 00 00 00       	call   130b <close>
  return r;
    1255:	83 c4 10             	add    $0x10,%esp
}
    1258:	8d 65 f8             	lea    -0x8(%ebp),%esp
    125b:	89 f0                	mov    %esi,%eax
    125d:	5b                   	pop    %ebx
    125e:	5e                   	pop    %esi
    125f:	5d                   	pop    %ebp
    1260:	c3                   	ret    
    1261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1268:	be ff ff ff ff       	mov    $0xffffffff,%esi
    126d:	eb e9                	jmp    1258 <stat+0x38>
    126f:	90                   	nop

00001270 <atoi>:

int
atoi(const char *s)
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	53                   	push   %ebx
    1278:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    127b:	0f be 02             	movsbl (%edx),%eax
    127e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1281:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1284:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1289:	77 1a                	ja     12a5 <atoi+0x35>
    128b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    128f:	90                   	nop
    n = n*10 + *s++ - '0';
    1290:	83 c2 01             	add    $0x1,%edx
    1293:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1296:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    129a:	0f be 02             	movsbl (%edx),%eax
    129d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    12a0:	80 fb 09             	cmp    $0x9,%bl
    12a3:	76 eb                	jbe    1290 <atoi+0x20>
  return n;
}
    12a5:	89 c8                	mov    %ecx,%eax
    12a7:	5b                   	pop    %ebx
    12a8:	5d                   	pop    %ebp
    12a9:	c3                   	ret    
    12aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12b0:	f3 0f 1e fb          	endbr32 
    12b4:	55                   	push   %ebp
    12b5:	89 e5                	mov    %esp,%ebp
    12b7:	57                   	push   %edi
    12b8:	8b 45 10             	mov    0x10(%ebp),%eax
    12bb:	8b 55 08             	mov    0x8(%ebp),%edx
    12be:	56                   	push   %esi
    12bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12c2:	85 c0                	test   %eax,%eax
    12c4:	7e 0f                	jle    12d5 <memmove+0x25>
    12c6:	01 d0                	add    %edx,%eax
  dst = vdst;
    12c8:	89 d7                	mov    %edx,%edi
    12ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12d1:	39 f8                	cmp    %edi,%eax
    12d3:	75 fb                	jne    12d0 <memmove+0x20>
  return vdst;
}
    12d5:	5e                   	pop    %esi
    12d6:	89 d0                	mov    %edx,%eax
    12d8:	5f                   	pop    %edi
    12d9:	5d                   	pop    %ebp
    12da:	c3                   	ret    

000012db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12db:	b8 01 00 00 00       	mov    $0x1,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <exit>:
SYSCALL(exit)
    12e3:	b8 02 00 00 00       	mov    $0x2,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <wait>:
SYSCALL(wait)
    12eb:	b8 03 00 00 00       	mov    $0x3,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <pipe>:
SYSCALL(pipe)
    12f3:	b8 04 00 00 00       	mov    $0x4,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <read>:
SYSCALL(read)
    12fb:	b8 05 00 00 00       	mov    $0x5,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <write>:
SYSCALL(write)
    1303:	b8 10 00 00 00       	mov    $0x10,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <close>:
SYSCALL(close)
    130b:	b8 15 00 00 00       	mov    $0x15,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <kill>:
SYSCALL(kill)
    1313:	b8 06 00 00 00       	mov    $0x6,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <exec>:
SYSCALL(exec)
    131b:	b8 07 00 00 00       	mov    $0x7,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <open>:
SYSCALL(open)
    1323:	b8 0f 00 00 00       	mov    $0xf,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <mknod>:
SYSCALL(mknod)
    132b:	b8 11 00 00 00       	mov    $0x11,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <unlink>:
SYSCALL(unlink)
    1333:	b8 12 00 00 00       	mov    $0x12,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <fstat>:
SYSCALL(fstat)
    133b:	b8 08 00 00 00       	mov    $0x8,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <link>:
SYSCALL(link)
    1343:	b8 13 00 00 00       	mov    $0x13,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <mkdir>:
SYSCALL(mkdir)
    134b:	b8 14 00 00 00       	mov    $0x14,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <chdir>:
SYSCALL(chdir)
    1353:	b8 09 00 00 00       	mov    $0x9,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <dup>:
SYSCALL(dup)
    135b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <getpid>:
SYSCALL(getpid)
    1363:	b8 0b 00 00 00       	mov    $0xb,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <sbrk>:
SYSCALL(sbrk)
    136b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <sleep>:
SYSCALL(sleep)
    1373:	b8 0d 00 00 00       	mov    $0xd,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <uptime>:
SYSCALL(uptime)
    137b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <shm_open>:
SYSCALL(shm_open)
    1383:	b8 16 00 00 00       	mov    $0x16,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <shm_close>:
SYSCALL(shm_close)	
    138b:	b8 17 00 00 00       	mov    $0x17,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    
    1393:	66 90                	xchg   %ax,%ax
    1395:	66 90                	xchg   %ax,%ax
    1397:	66 90                	xchg   %ax,%ax
    1399:	66 90                	xchg   %ax,%ax
    139b:	66 90                	xchg   %ax,%ax
    139d:	66 90                	xchg   %ax,%ax
    139f:	90                   	nop

000013a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	57                   	push   %edi
    13a4:	56                   	push   %esi
    13a5:	53                   	push   %ebx
    13a6:	83 ec 3c             	sub    $0x3c,%esp
    13a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13ac:	89 d1                	mov    %edx,%ecx
{
    13ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13b1:	85 d2                	test   %edx,%edx
    13b3:	0f 89 7f 00 00 00    	jns    1438 <printint+0x98>
    13b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13bd:	74 79                	je     1438 <printint+0x98>
    neg = 1;
    13bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13c8:	31 db                	xor    %ebx,%ebx
    13ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13d0:	89 c8                	mov    %ecx,%eax
    13d2:	31 d2                	xor    %edx,%edx
    13d4:	89 cf                	mov    %ecx,%edi
    13d6:	f7 75 c4             	divl   -0x3c(%ebp)
    13d9:	0f b6 92 2c 18 00 00 	movzbl 0x182c(%edx),%edx
    13e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13e3:	89 d8                	mov    %ebx,%eax
    13e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13f1:	76 dd                	jbe    13d0 <printint+0x30>
  if(neg)
    13f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13f6:	85 c9                	test   %ecx,%ecx
    13f8:	74 0c                	je     1406 <printint+0x66>
    buf[i++] = '-';
    13fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1401:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1406:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1409:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    140d:	eb 07                	jmp    1416 <printint+0x76>
    140f:	90                   	nop
    1410:	0f b6 13             	movzbl (%ebx),%edx
    1413:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1416:	83 ec 04             	sub    $0x4,%esp
    1419:	88 55 d7             	mov    %dl,-0x29(%ebp)
    141c:	6a 01                	push   $0x1
    141e:	56                   	push   %esi
    141f:	57                   	push   %edi
    1420:	e8 de fe ff ff       	call   1303 <write>
  while(--i >= 0)
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	39 de                	cmp    %ebx,%esi
    142a:	75 e4                	jne    1410 <printint+0x70>
    putc(fd, buf[i]);
}
    142c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    142f:	5b                   	pop    %ebx
    1430:	5e                   	pop    %esi
    1431:	5f                   	pop    %edi
    1432:	5d                   	pop    %ebp
    1433:	c3                   	ret    
    1434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1438:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    143f:	eb 87                	jmp    13c8 <printint+0x28>
    1441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    144f:	90                   	nop

00001450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1450:	f3 0f 1e fb          	endbr32 
    1454:	55                   	push   %ebp
    1455:	89 e5                	mov    %esp,%ebp
    1457:	57                   	push   %edi
    1458:	56                   	push   %esi
    1459:	53                   	push   %ebx
    145a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    145d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1460:	0f b6 1e             	movzbl (%esi),%ebx
    1463:	84 db                	test   %bl,%bl
    1465:	0f 84 b4 00 00 00    	je     151f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    146b:	8d 45 10             	lea    0x10(%ebp),%eax
    146e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1471:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1474:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1476:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1479:	eb 33                	jmp    14ae <printf+0x5e>
    147b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    147f:	90                   	nop
    1480:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1483:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1488:	83 f8 25             	cmp    $0x25,%eax
    148b:	74 17                	je     14a4 <printf+0x54>
  write(fd, &c, 1);
    148d:	83 ec 04             	sub    $0x4,%esp
    1490:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1493:	6a 01                	push   $0x1
    1495:	57                   	push   %edi
    1496:	ff 75 08             	pushl  0x8(%ebp)
    1499:	e8 65 fe ff ff       	call   1303 <write>
    149e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    14a1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    14a4:	0f b6 1e             	movzbl (%esi),%ebx
    14a7:	83 c6 01             	add    $0x1,%esi
    14aa:	84 db                	test   %bl,%bl
    14ac:	74 71                	je     151f <printf+0xcf>
    c = fmt[i] & 0xff;
    14ae:	0f be cb             	movsbl %bl,%ecx
    14b1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14b4:	85 d2                	test   %edx,%edx
    14b6:	74 c8                	je     1480 <printf+0x30>
      }
    } else if(state == '%'){
    14b8:	83 fa 25             	cmp    $0x25,%edx
    14bb:	75 e7                	jne    14a4 <printf+0x54>
      if(c == 'd'){
    14bd:	83 f8 64             	cmp    $0x64,%eax
    14c0:	0f 84 9a 00 00 00    	je     1560 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14c6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14cc:	83 f9 70             	cmp    $0x70,%ecx
    14cf:	74 5f                	je     1530 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14d1:	83 f8 73             	cmp    $0x73,%eax
    14d4:	0f 84 d6 00 00 00    	je     15b0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14da:	83 f8 63             	cmp    $0x63,%eax
    14dd:	0f 84 8d 00 00 00    	je     1570 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14e3:	83 f8 25             	cmp    $0x25,%eax
    14e6:	0f 84 b4 00 00 00    	je     15a0 <printf+0x150>
  write(fd, &c, 1);
    14ec:	83 ec 04             	sub    $0x4,%esp
    14ef:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14f3:	6a 01                	push   $0x1
    14f5:	57                   	push   %edi
    14f6:	ff 75 08             	pushl  0x8(%ebp)
    14f9:	e8 05 fe ff ff       	call   1303 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1501:	83 c4 0c             	add    $0xc,%esp
    1504:	6a 01                	push   $0x1
    1506:	83 c6 01             	add    $0x1,%esi
    1509:	57                   	push   %edi
    150a:	ff 75 08             	pushl  0x8(%ebp)
    150d:	e8 f1 fd ff ff       	call   1303 <write>
  for(i = 0; fmt[i]; i++){
    1512:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1516:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1519:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    151b:	84 db                	test   %bl,%bl
    151d:	75 8f                	jne    14ae <printf+0x5e>
    }
  }
}
    151f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1522:	5b                   	pop    %ebx
    1523:	5e                   	pop    %esi
    1524:	5f                   	pop    %edi
    1525:	5d                   	pop    %ebp
    1526:	c3                   	ret    
    1527:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    152e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1530:	83 ec 0c             	sub    $0xc,%esp
    1533:	b9 10 00 00 00       	mov    $0x10,%ecx
    1538:	6a 00                	push   $0x0
    153a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    153d:	8b 45 08             	mov    0x8(%ebp),%eax
    1540:	8b 13                	mov    (%ebx),%edx
    1542:	e8 59 fe ff ff       	call   13a0 <printint>
        ap++;
    1547:	89 d8                	mov    %ebx,%eax
    1549:	83 c4 10             	add    $0x10,%esp
      state = 0;
    154c:	31 d2                	xor    %edx,%edx
        ap++;
    154e:	83 c0 04             	add    $0x4,%eax
    1551:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1554:	e9 4b ff ff ff       	jmp    14a4 <printf+0x54>
    1559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1560:	83 ec 0c             	sub    $0xc,%esp
    1563:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1568:	6a 01                	push   $0x1
    156a:	eb ce                	jmp    153a <printf+0xea>
    156c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1570:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1573:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1576:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1578:	6a 01                	push   $0x1
        ap++;
    157a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    157d:	57                   	push   %edi
    157e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1581:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1584:	e8 7a fd ff ff       	call   1303 <write>
        ap++;
    1589:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    158c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    158f:	31 d2                	xor    %edx,%edx
    1591:	e9 0e ff ff ff       	jmp    14a4 <printf+0x54>
    1596:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    159d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    15a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    15a3:	83 ec 04             	sub    $0x4,%esp
    15a6:	e9 59 ff ff ff       	jmp    1504 <printf+0xb4>
    15ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15af:	90                   	nop
        s = (char*)*ap;
    15b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15b3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15b5:	83 c0 04             	add    $0x4,%eax
    15b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15bb:	85 db                	test   %ebx,%ebx
    15bd:	74 17                	je     15d6 <printf+0x186>
        while(*s != 0){
    15bf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    15c2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    15c4:	84 c0                	test   %al,%al
    15c6:	0f 84 d8 fe ff ff    	je     14a4 <printf+0x54>
    15cc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15cf:	89 de                	mov    %ebx,%esi
    15d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15d4:	eb 1a                	jmp    15f0 <printf+0x1a0>
          s = "(null)";
    15d6:	bb 25 18 00 00       	mov    $0x1825,%ebx
        while(*s != 0){
    15db:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15de:	b8 28 00 00 00       	mov    $0x28,%eax
    15e3:	89 de                	mov    %ebx,%esi
    15e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ef:	90                   	nop
  write(fd, &c, 1);
    15f0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15f3:	83 c6 01             	add    $0x1,%esi
    15f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15f9:	6a 01                	push   $0x1
    15fb:	57                   	push   %edi
    15fc:	53                   	push   %ebx
    15fd:	e8 01 fd ff ff       	call   1303 <write>
        while(*s != 0){
    1602:	0f b6 06             	movzbl (%esi),%eax
    1605:	83 c4 10             	add    $0x10,%esp
    1608:	84 c0                	test   %al,%al
    160a:	75 e4                	jne    15f0 <printf+0x1a0>
    160c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    160f:	31 d2                	xor    %edx,%edx
    1611:	e9 8e fe ff ff       	jmp    14a4 <printf+0x54>
    1616:	66 90                	xchg   %ax,%ax
    1618:	66 90                	xchg   %ax,%ax
    161a:	66 90                	xchg   %ax,%ax
    161c:	66 90                	xchg   %ax,%ax
    161e:	66 90                	xchg   %ax,%ax

00001620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1620:	f3 0f 1e fb          	endbr32 
    1624:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1625:	a1 24 1b 00 00       	mov    0x1b24,%eax
{
    162a:	89 e5                	mov    %esp,%ebp
    162c:	57                   	push   %edi
    162d:	56                   	push   %esi
    162e:	53                   	push   %ebx
    162f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1632:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1634:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1637:	39 c8                	cmp    %ecx,%eax
    1639:	73 15                	jae    1650 <free+0x30>
    163b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    163f:	90                   	nop
    1640:	39 d1                	cmp    %edx,%ecx
    1642:	72 14                	jb     1658 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1644:	39 d0                	cmp    %edx,%eax
    1646:	73 10                	jae    1658 <free+0x38>
{
    1648:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    164a:	8b 10                	mov    (%eax),%edx
    164c:	39 c8                	cmp    %ecx,%eax
    164e:	72 f0                	jb     1640 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1650:	39 d0                	cmp    %edx,%eax
    1652:	72 f4                	jb     1648 <free+0x28>
    1654:	39 d1                	cmp    %edx,%ecx
    1656:	73 f0                	jae    1648 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1658:	8b 73 fc             	mov    -0x4(%ebx),%esi
    165b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    165e:	39 fa                	cmp    %edi,%edx
    1660:	74 1e                	je     1680 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1662:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1665:	8b 50 04             	mov    0x4(%eax),%edx
    1668:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    166b:	39 f1                	cmp    %esi,%ecx
    166d:	74 28                	je     1697 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    166f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1671:	5b                   	pop    %ebx
  freep = p;
    1672:	a3 24 1b 00 00       	mov    %eax,0x1b24
}
    1677:	5e                   	pop    %esi
    1678:	5f                   	pop    %edi
    1679:	5d                   	pop    %ebp
    167a:	c3                   	ret    
    167b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    167f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1680:	03 72 04             	add    0x4(%edx),%esi
    1683:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1686:	8b 10                	mov    (%eax),%edx
    1688:	8b 12                	mov    (%edx),%edx
    168a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    168d:	8b 50 04             	mov    0x4(%eax),%edx
    1690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1693:	39 f1                	cmp    %esi,%ecx
    1695:	75 d8                	jne    166f <free+0x4f>
    p->s.size += bp->s.size;
    1697:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    169a:	a3 24 1b 00 00       	mov    %eax,0x1b24
    p->s.size += bp->s.size;
    169f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16a2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    16a5:	89 10                	mov    %edx,(%eax)
}
    16a7:	5b                   	pop    %ebx
    16a8:	5e                   	pop    %esi
    16a9:	5f                   	pop    %edi
    16aa:	5d                   	pop    %ebp
    16ab:	c3                   	ret    
    16ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16b0:	f3 0f 1e fb          	endbr32 
    16b4:	55                   	push   %ebp
    16b5:	89 e5                	mov    %esp,%ebp
    16b7:	57                   	push   %edi
    16b8:	56                   	push   %esi
    16b9:	53                   	push   %ebx
    16ba:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16bd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16c0:	8b 3d 24 1b 00 00    	mov    0x1b24,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16c6:	8d 70 07             	lea    0x7(%eax),%esi
    16c9:	c1 ee 03             	shr    $0x3,%esi
    16cc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16cf:	85 ff                	test   %edi,%edi
    16d1:	0f 84 a9 00 00 00    	je     1780 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16d7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    16d9:	8b 48 04             	mov    0x4(%eax),%ecx
    16dc:	39 f1                	cmp    %esi,%ecx
    16de:	73 6d                	jae    174d <malloc+0x9d>
    16e0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16e6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16eb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16ee:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16f5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16f8:	eb 17                	jmp    1711 <malloc+0x61>
    16fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1700:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1702:	8b 4a 04             	mov    0x4(%edx),%ecx
    1705:	39 f1                	cmp    %esi,%ecx
    1707:	73 4f                	jae    1758 <malloc+0xa8>
    1709:	8b 3d 24 1b 00 00    	mov    0x1b24,%edi
    170f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1711:	39 c7                	cmp    %eax,%edi
    1713:	75 eb                	jne    1700 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1715:	83 ec 0c             	sub    $0xc,%esp
    1718:	ff 75 e4             	pushl  -0x1c(%ebp)
    171b:	e8 4b fc ff ff       	call   136b <sbrk>
  if(p == (char*)-1)
    1720:	83 c4 10             	add    $0x10,%esp
    1723:	83 f8 ff             	cmp    $0xffffffff,%eax
    1726:	74 1b                	je     1743 <malloc+0x93>
  hp->s.size = nu;
    1728:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    172b:	83 ec 0c             	sub    $0xc,%esp
    172e:	83 c0 08             	add    $0x8,%eax
    1731:	50                   	push   %eax
    1732:	e8 e9 fe ff ff       	call   1620 <free>
  return freep;
    1737:	a1 24 1b 00 00       	mov    0x1b24,%eax
      if((p = morecore(nunits)) == 0)
    173c:	83 c4 10             	add    $0x10,%esp
    173f:	85 c0                	test   %eax,%eax
    1741:	75 bd                	jne    1700 <malloc+0x50>
        return 0;
  }
}
    1743:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1746:	31 c0                	xor    %eax,%eax
}
    1748:	5b                   	pop    %ebx
    1749:	5e                   	pop    %esi
    174a:	5f                   	pop    %edi
    174b:	5d                   	pop    %ebp
    174c:	c3                   	ret    
    if(p->s.size >= nunits){
    174d:	89 c2                	mov    %eax,%edx
    174f:	89 f8                	mov    %edi,%eax
    1751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1758:	39 ce                	cmp    %ecx,%esi
    175a:	74 54                	je     17b0 <malloc+0x100>
        p->s.size -= nunits;
    175c:	29 f1                	sub    %esi,%ecx
    175e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1761:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1764:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1767:	a3 24 1b 00 00       	mov    %eax,0x1b24
}
    176c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    176f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1772:	5b                   	pop    %ebx
    1773:	5e                   	pop    %esi
    1774:	5f                   	pop    %edi
    1775:	5d                   	pop    %ebp
    1776:	c3                   	ret    
    1777:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    177e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1780:	c7 05 24 1b 00 00 28 	movl   $0x1b28,0x1b24
    1787:	1b 00 00 
    base.s.size = 0;
    178a:	bf 28 1b 00 00       	mov    $0x1b28,%edi
    base.s.ptr = freep = prevp = &base;
    178f:	c7 05 28 1b 00 00 28 	movl   $0x1b28,0x1b28
    1796:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1799:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    179b:	c7 05 2c 1b 00 00 00 	movl   $0x0,0x1b2c
    17a2:	00 00 00 
    if(p->s.size >= nunits){
    17a5:	e9 36 ff ff ff       	jmp    16e0 <malloc+0x30>
    17aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17b0:	8b 0a                	mov    (%edx),%ecx
    17b2:	89 08                	mov    %ecx,(%eax)
    17b4:	eb b1                	jmp    1767 <malloc+0xb7>
    17b6:	66 90                	xchg   %ax,%ax
    17b8:	66 90                	xchg   %ax,%ax
    17ba:	66 90                	xchg   %ax,%ax
    17bc:	66 90                	xchg   %ax,%ax
    17be:	66 90                	xchg   %ax,%ax

000017c0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17c0:	f3 0f 1e fb          	endbr32 
    17c4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17c5:	b9 01 00 00 00       	mov    $0x1,%ecx
    17ca:	89 e5                	mov    %esp,%ebp
    17cc:	8b 55 08             	mov    0x8(%ebp),%edx
    17cf:	90                   	nop
    17d0:	89 c8                	mov    %ecx,%eax
    17d2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17d5:	85 c0                	test   %eax,%eax
    17d7:	75 f7                	jne    17d0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17d9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17de:	5d                   	pop    %ebp
    17df:	c3                   	ret    

000017e0 <urelease>:

void urelease (struct uspinlock *lk) {
    17e0:	f3 0f 1e fb          	endbr32 
    17e4:	55                   	push   %ebp
    17e5:	89 e5                	mov    %esp,%ebp
    17e7:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17ea:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17f5:	5d                   	pop    %ebp
    17f6:	c3                   	ret    
