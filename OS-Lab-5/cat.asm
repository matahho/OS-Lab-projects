
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  }
}

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
    1012:	56                   	push   %esi
    1013:	be 01 00 00 00       	mov    $0x1,%esi
    1018:	53                   	push   %ebx
    1019:	51                   	push   %ecx
    101a:	83 ec 18             	sub    $0x18,%esp
    101d:	8b 01                	mov    (%ecx),%eax
    101f:	8b 59 04             	mov    0x4(%ecx),%ebx
    1022:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1025:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1028:	83 f8 01             	cmp    $0x1,%eax
    102b:	7e 50                	jle    107d <main+0x7d>
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 77 03 00 00       	call   13b3 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 24                	js     1069 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    1045:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
    1048:	83 c6 01             	add    $0x1,%esi
    104b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
    104e:	50                   	push   %eax
    104f:	e8 3c 00 00 00       	call   1090 <cat>
    close(fd);
    1054:	89 3c 24             	mov    %edi,(%esp)
    1057:	e8 3f 03 00 00       	call   139b <close>
  for(i = 1; i < argc; i++){
    105c:	83 c4 10             	add    $0x10,%esp
    105f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1062:	75 cc                	jne    1030 <main+0x30>
  }
  exit();
    1064:	e8 0a 03 00 00       	call   1373 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
    1069:	50                   	push   %eax
    106a:	ff 33                	pushl  (%ebx)
    106c:	68 ab 18 00 00       	push   $0x18ab
    1071:	6a 01                	push   $0x1
    1073:	e8 68 04 00 00       	call   14e0 <printf>
      exit();
    1078:	e8 f6 02 00 00       	call   1373 <exit>
    cat(0);
    107d:	83 ec 0c             	sub    $0xc,%esp
    1080:	6a 00                	push   $0x0
    1082:	e8 09 00 00 00       	call   1090 <cat>
    exit();
    1087:	e8 e7 02 00 00       	call   1373 <exit>
    108c:	66 90                	xchg   %ax,%ax
    108e:	66 90                	xchg   %ax,%ax

00001090 <cat>:
{
    1090:	f3 0f 1e fb          	endbr32 
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
    1097:	56                   	push   %esi
    1098:	8b 75 08             	mov    0x8(%ebp),%esi
    109b:	53                   	push   %ebx
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    109c:	eb 19                	jmp    10b7 <cat+0x27>
    109e:	66 90                	xchg   %ax,%ax
    if (write(1, buf, n) != n) {
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	53                   	push   %ebx
    10a4:	68 20 1c 00 00       	push   $0x1c20
    10a9:	6a 01                	push   $0x1
    10ab:	e8 e3 02 00 00       	call   1393 <write>
    10b0:	83 c4 10             	add    $0x10,%esp
    10b3:	39 d8                	cmp    %ebx,%eax
    10b5:	75 25                	jne    10dc <cat+0x4c>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
    10b7:	83 ec 04             	sub    $0x4,%esp
    10ba:	68 00 02 00 00       	push   $0x200
    10bf:	68 20 1c 00 00       	push   $0x1c20
    10c4:	56                   	push   %esi
    10c5:	e8 c1 02 00 00       	call   138b <read>
    10ca:	83 c4 10             	add    $0x10,%esp
    10cd:	89 c3                	mov    %eax,%ebx
    10cf:	85 c0                	test   %eax,%eax
    10d1:	7f cd                	jg     10a0 <cat+0x10>
  if(n < 0){
    10d3:	75 1b                	jne    10f0 <cat+0x60>
}
    10d5:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10d8:	5b                   	pop    %ebx
    10d9:	5e                   	pop    %esi
    10da:	5d                   	pop    %ebp
    10db:	c3                   	ret    
      printf(1, "cat: write error\n");
    10dc:	83 ec 08             	sub    $0x8,%esp
    10df:	68 88 18 00 00       	push   $0x1888
    10e4:	6a 01                	push   $0x1
    10e6:	e8 f5 03 00 00       	call   14e0 <printf>
      exit();
    10eb:	e8 83 02 00 00       	call   1373 <exit>
    printf(1, "cat: read error\n");
    10f0:	50                   	push   %eax
    10f1:	50                   	push   %eax
    10f2:	68 9a 18 00 00       	push   $0x189a
    10f7:	6a 01                	push   $0x1
    10f9:	e8 e2 03 00 00       	call   14e0 <printf>
    exit();
    10fe:	e8 70 02 00 00       	call   1373 <exit>
    1103:	66 90                	xchg   %ax,%ax
    1105:	66 90                	xchg   %ax,%ax
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1110:	f3 0f 1e fb          	endbr32 
    1114:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1115:	31 c0                	xor    %eax,%eax
{
    1117:	89 e5                	mov    %esp,%ebp
    1119:	53                   	push   %ebx
    111a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    111d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1127:	83 c0 01             	add    $0x1,%eax
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    112e:	89 c8                	mov    %ecx,%eax
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	f3 0f 1e fb          	endbr32 
    1144:	55                   	push   %ebp
    1145:	89 e5                	mov    %esp,%ebp
    1147:	53                   	push   %ebx
    1148:	8b 4d 08             	mov    0x8(%ebp),%ecx
    114b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    114e:	0f b6 01             	movzbl (%ecx),%eax
    1151:	0f b6 1a             	movzbl (%edx),%ebx
    1154:	84 c0                	test   %al,%al
    1156:	75 19                	jne    1171 <strcmp+0x31>
    1158:	eb 26                	jmp    1180 <strcmp+0x40>
    115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1160:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1164:	83 c1 01             	add    $0x1,%ecx
    1167:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    116a:	0f b6 1a             	movzbl (%edx),%ebx
    116d:	84 c0                	test   %al,%al
    116f:	74 0f                	je     1180 <strcmp+0x40>
    1171:	38 d8                	cmp    %bl,%al
    1173:	74 eb                	je     1160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1175:	29 d8                	sub    %ebx,%eax
}
    1177:	5b                   	pop    %ebx
    1178:	5d                   	pop    %ebp
    1179:	c3                   	ret    
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1182:	29 d8                	sub    %ebx,%eax
}
    1184:	5b                   	pop    %ebx
    1185:	5d                   	pop    %ebp
    1186:	c3                   	ret    
    1187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    118e:	66 90                	xchg   %ax,%ax

00001190 <strlen>:

uint
strlen(char *s)
{
    1190:	f3 0f 1e fb          	endbr32 
    1194:	55                   	push   %ebp
    1195:	89 e5                	mov    %esp,%ebp
    1197:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    119a:	80 3a 00             	cmpb   $0x0,(%edx)
    119d:	74 21                	je     11c0 <strlen+0x30>
    119f:	31 c0                	xor    %eax,%eax
    11a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11a8:	83 c0 01             	add    $0x1,%eax
    11ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11af:	89 c1                	mov    %eax,%ecx
    11b1:	75 f5                	jne    11a8 <strlen+0x18>
    ;
  return n;
}
    11b3:	89 c8                	mov    %ecx,%eax
    11b5:	5d                   	pop    %ebp
    11b6:	c3                   	ret    
    11b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    11c0:	31 c9                	xor    %ecx,%ecx
}
    11c2:	5d                   	pop    %ebp
    11c3:	89 c8                	mov    %ecx,%eax
    11c5:	c3                   	ret    
    11c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11cd:	8d 76 00             	lea    0x0(%esi),%esi

000011d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d0:	f3 0f 1e fb          	endbr32 
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
    11d7:	57                   	push   %edi
    11d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11db:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11de:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e1:	89 d7                	mov    %edx,%edi
    11e3:	fc                   	cld    
    11e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11e6:	89 d0                	mov    %edx,%eax
    11e8:	5f                   	pop    %edi
    11e9:	5d                   	pop    %ebp
    11ea:	c3                   	ret    
    11eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11ef:	90                   	nop

000011f0 <strchr>:

char*
strchr(const char *s, char c)
{
    11f0:	f3 0f 1e fb          	endbr32 
    11f4:	55                   	push   %ebp
    11f5:	89 e5                	mov    %esp,%ebp
    11f7:	8b 45 08             	mov    0x8(%ebp),%eax
    11fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11fe:	0f b6 10             	movzbl (%eax),%edx
    1201:	84 d2                	test   %dl,%dl
    1203:	75 16                	jne    121b <strchr+0x2b>
    1205:	eb 21                	jmp    1228 <strchr+0x38>
    1207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120e:	66 90                	xchg   %ax,%ax
    1210:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1214:	83 c0 01             	add    $0x1,%eax
    1217:	84 d2                	test   %dl,%dl
    1219:	74 0d                	je     1228 <strchr+0x38>
    if(*s == c)
    121b:	38 d1                	cmp    %dl,%cl
    121d:	75 f1                	jne    1210 <strchr+0x20>
      return (char*)s;
  return 0;
}
    121f:	5d                   	pop    %ebp
    1220:	c3                   	ret    
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1228:	31 c0                	xor    %eax,%eax
}
    122a:	5d                   	pop    %ebp
    122b:	c3                   	ret    
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001230 <gets>:

char*
gets(char *buf, int max)
{
    1230:	f3 0f 1e fb          	endbr32 
    1234:	55                   	push   %ebp
    1235:	89 e5                	mov    %esp,%ebp
    1237:	57                   	push   %edi
    1238:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1239:	31 f6                	xor    %esi,%esi
{
    123b:	53                   	push   %ebx
    123c:	89 f3                	mov    %esi,%ebx
    123e:	83 ec 1c             	sub    $0x1c,%esp
    1241:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1244:	eb 33                	jmp    1279 <gets+0x49>
    1246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1250:	83 ec 04             	sub    $0x4,%esp
    1253:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1256:	6a 01                	push   $0x1
    1258:	50                   	push   %eax
    1259:	6a 00                	push   $0x0
    125b:	e8 2b 01 00 00       	call   138b <read>
    if(cc < 1)
    1260:	83 c4 10             	add    $0x10,%esp
    1263:	85 c0                	test   %eax,%eax
    1265:	7e 1c                	jle    1283 <gets+0x53>
      break;
    buf[i++] = c;
    1267:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    126b:	83 c7 01             	add    $0x1,%edi
    126e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1271:	3c 0a                	cmp    $0xa,%al
    1273:	74 23                	je     1298 <gets+0x68>
    1275:	3c 0d                	cmp    $0xd,%al
    1277:	74 1f                	je     1298 <gets+0x68>
  for(i=0; i+1 < max; ){
    1279:	83 c3 01             	add    $0x1,%ebx
    127c:	89 fe                	mov    %edi,%esi
    127e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1281:	7c cd                	jl     1250 <gets+0x20>
    1283:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1285:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1288:	c6 03 00             	movb   $0x0,(%ebx)
}
    128b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    128e:	5b                   	pop    %ebx
    128f:	5e                   	pop    %esi
    1290:	5f                   	pop    %edi
    1291:	5d                   	pop    %ebp
    1292:	c3                   	ret    
    1293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1297:	90                   	nop
    1298:	8b 75 08             	mov    0x8(%ebp),%esi
    129b:	8b 45 08             	mov    0x8(%ebp),%eax
    129e:	01 de                	add    %ebx,%esi
    12a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12a2:	c6 03 00             	movb   $0x0,(%ebx)
}
    12a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12a8:	5b                   	pop    %ebx
    12a9:	5e                   	pop    %esi
    12aa:	5f                   	pop    %edi
    12ab:	5d                   	pop    %ebp
    12ac:	c3                   	ret    
    12ad:	8d 76 00             	lea    0x0(%esi),%esi

000012b0 <stat>:

int
stat(char *n, struct stat *st)
{
    12b0:	f3 0f 1e fb          	endbr32 
    12b4:	55                   	push   %ebp
    12b5:	89 e5                	mov    %esp,%ebp
    12b7:	56                   	push   %esi
    12b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12b9:	83 ec 08             	sub    $0x8,%esp
    12bc:	6a 00                	push   $0x0
    12be:	ff 75 08             	pushl  0x8(%ebp)
    12c1:	e8 ed 00 00 00       	call   13b3 <open>
  if(fd < 0)
    12c6:	83 c4 10             	add    $0x10,%esp
    12c9:	85 c0                	test   %eax,%eax
    12cb:	78 2b                	js     12f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12cd:	83 ec 08             	sub    $0x8,%esp
    12d0:	ff 75 0c             	pushl  0xc(%ebp)
    12d3:	89 c3                	mov    %eax,%ebx
    12d5:	50                   	push   %eax
    12d6:	e8 f0 00 00 00       	call   13cb <fstat>
  close(fd);
    12db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12de:	89 c6                	mov    %eax,%esi
  close(fd);
    12e0:	e8 b6 00 00 00       	call   139b <close>
  return r;
    12e5:	83 c4 10             	add    $0x10,%esp
}
    12e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12eb:	89 f0                	mov    %esi,%eax
    12ed:	5b                   	pop    %ebx
    12ee:	5e                   	pop    %esi
    12ef:	5d                   	pop    %ebp
    12f0:	c3                   	ret    
    12f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12fd:	eb e9                	jmp    12e8 <stat+0x38>
    12ff:	90                   	nop

00001300 <atoi>:

int
atoi(const char *s)
{
    1300:	f3 0f 1e fb          	endbr32 
    1304:	55                   	push   %ebp
    1305:	89 e5                	mov    %esp,%ebp
    1307:	53                   	push   %ebx
    1308:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    130b:	0f be 02             	movsbl (%edx),%eax
    130e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1311:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1314:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1319:	77 1a                	ja     1335 <atoi+0x35>
    131b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    131f:	90                   	nop
    n = n*10 + *s++ - '0';
    1320:	83 c2 01             	add    $0x1,%edx
    1323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    132a:	0f be 02             	movsbl (%edx),%eax
    132d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1330:	80 fb 09             	cmp    $0x9,%bl
    1333:	76 eb                	jbe    1320 <atoi+0x20>
  return n;
}
    1335:	89 c8                	mov    %ecx,%eax
    1337:	5b                   	pop    %ebx
    1338:	5d                   	pop    %ebp
    1339:	c3                   	ret    
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001340 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1340:	f3 0f 1e fb          	endbr32 
    1344:	55                   	push   %ebp
    1345:	89 e5                	mov    %esp,%ebp
    1347:	57                   	push   %edi
    1348:	8b 45 10             	mov    0x10(%ebp),%eax
    134b:	8b 55 08             	mov    0x8(%ebp),%edx
    134e:	56                   	push   %esi
    134f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1352:	85 c0                	test   %eax,%eax
    1354:	7e 0f                	jle    1365 <memmove+0x25>
    1356:	01 d0                	add    %edx,%eax
  dst = vdst;
    1358:	89 d7                	mov    %edx,%edi
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1361:	39 f8                	cmp    %edi,%eax
    1363:	75 fb                	jne    1360 <memmove+0x20>
  return vdst;
}
    1365:	5e                   	pop    %esi
    1366:	89 d0                	mov    %edx,%eax
    1368:	5f                   	pop    %edi
    1369:	5d                   	pop    %ebp
    136a:	c3                   	ret    

0000136b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    136b:	b8 01 00 00 00       	mov    $0x1,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <exit>:
SYSCALL(exit)
    1373:	b8 02 00 00 00       	mov    $0x2,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <wait>:
SYSCALL(wait)
    137b:	b8 03 00 00 00       	mov    $0x3,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <pipe>:
SYSCALL(pipe)
    1383:	b8 04 00 00 00       	mov    $0x4,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <read>:
SYSCALL(read)
    138b:	b8 05 00 00 00       	mov    $0x5,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <write>:
SYSCALL(write)
    1393:	b8 10 00 00 00       	mov    $0x10,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <close>:
SYSCALL(close)
    139b:	b8 15 00 00 00       	mov    $0x15,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <kill>:
SYSCALL(kill)
    13a3:	b8 06 00 00 00       	mov    $0x6,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <exec>:
SYSCALL(exec)
    13ab:	b8 07 00 00 00       	mov    $0x7,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <open>:
SYSCALL(open)
    13b3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <mknod>:
SYSCALL(mknod)
    13bb:	b8 11 00 00 00       	mov    $0x11,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <unlink>:
SYSCALL(unlink)
    13c3:	b8 12 00 00 00       	mov    $0x12,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <fstat>:
SYSCALL(fstat)
    13cb:	b8 08 00 00 00       	mov    $0x8,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <link>:
SYSCALL(link)
    13d3:	b8 13 00 00 00       	mov    $0x13,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <mkdir>:
SYSCALL(mkdir)
    13db:	b8 14 00 00 00       	mov    $0x14,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <chdir>:
SYSCALL(chdir)
    13e3:	b8 09 00 00 00       	mov    $0x9,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <dup>:
SYSCALL(dup)
    13eb:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <getpid>:
SYSCALL(getpid)
    13f3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <sbrk>:
SYSCALL(sbrk)
    13fb:	b8 0c 00 00 00       	mov    $0xc,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <sleep>:
SYSCALL(sleep)
    1403:	b8 0d 00 00 00       	mov    $0xd,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <uptime>:
SYSCALL(uptime)
    140b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <shm_open>:
SYSCALL(shm_open)
    1413:	b8 16 00 00 00       	mov    $0x16,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <shm_close>:
SYSCALL(shm_close)	
    141b:	b8 17 00 00 00       	mov    $0x17,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    
    1423:	66 90                	xchg   %ax,%ax
    1425:	66 90                	xchg   %ax,%ax
    1427:	66 90                	xchg   %ax,%ax
    1429:	66 90                	xchg   %ax,%ax
    142b:	66 90                	xchg   %ax,%ax
    142d:	66 90                	xchg   %ax,%ax
    142f:	90                   	nop

00001430 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	57                   	push   %edi
    1434:	56                   	push   %esi
    1435:	53                   	push   %ebx
    1436:	83 ec 3c             	sub    $0x3c,%esp
    1439:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    143c:	89 d1                	mov    %edx,%ecx
{
    143e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1441:	85 d2                	test   %edx,%edx
    1443:	0f 89 7f 00 00 00    	jns    14c8 <printint+0x98>
    1449:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    144d:	74 79                	je     14c8 <printint+0x98>
    neg = 1;
    144f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1456:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1458:	31 db                	xor    %ebx,%ebx
    145a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    145d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1460:	89 c8                	mov    %ecx,%eax
    1462:	31 d2                	xor    %edx,%edx
    1464:	89 cf                	mov    %ecx,%edi
    1466:	f7 75 c4             	divl   -0x3c(%ebp)
    1469:	0f b6 92 c8 18 00 00 	movzbl 0x18c8(%edx),%edx
    1470:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1473:	89 d8                	mov    %ebx,%eax
    1475:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1478:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    147b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    147e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1481:	76 dd                	jbe    1460 <printint+0x30>
  if(neg)
    1483:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1486:	85 c9                	test   %ecx,%ecx
    1488:	74 0c                	je     1496 <printint+0x66>
    buf[i++] = '-';
    148a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    148f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1491:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1496:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1499:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    149d:	eb 07                	jmp    14a6 <printint+0x76>
    149f:	90                   	nop
    14a0:	0f b6 13             	movzbl (%ebx),%edx
    14a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    14a6:	83 ec 04             	sub    $0x4,%esp
    14a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    14ac:	6a 01                	push   $0x1
    14ae:	56                   	push   %esi
    14af:	57                   	push   %edi
    14b0:	e8 de fe ff ff       	call   1393 <write>
  while(--i >= 0)
    14b5:	83 c4 10             	add    $0x10,%esp
    14b8:	39 de                	cmp    %ebx,%esi
    14ba:	75 e4                	jne    14a0 <printint+0x70>
    putc(fd, buf[i]);
}
    14bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bf:	5b                   	pop    %ebx
    14c0:	5e                   	pop    %esi
    14c1:	5f                   	pop    %edi
    14c2:	5d                   	pop    %ebp
    14c3:	c3                   	ret    
    14c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14cf:	eb 87                	jmp    1458 <printint+0x28>
    14d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14df:	90                   	nop

000014e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14e0:	f3 0f 1e fb          	endbr32 
    14e4:	55                   	push   %ebp
    14e5:	89 e5                	mov    %esp,%ebp
    14e7:	57                   	push   %edi
    14e8:	56                   	push   %esi
    14e9:	53                   	push   %ebx
    14ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ed:	8b 75 0c             	mov    0xc(%ebp),%esi
    14f0:	0f b6 1e             	movzbl (%esi),%ebx
    14f3:	84 db                	test   %bl,%bl
    14f5:	0f 84 b4 00 00 00    	je     15af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    14fb:	8d 45 10             	lea    0x10(%ebp),%eax
    14fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1501:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1504:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1506:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1509:	eb 33                	jmp    153e <printf+0x5e>
    150b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    150f:	90                   	nop
    1510:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1513:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1518:	83 f8 25             	cmp    $0x25,%eax
    151b:	74 17                	je     1534 <printf+0x54>
  write(fd, &c, 1);
    151d:	83 ec 04             	sub    $0x4,%esp
    1520:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1523:	6a 01                	push   $0x1
    1525:	57                   	push   %edi
    1526:	ff 75 08             	pushl  0x8(%ebp)
    1529:	e8 65 fe ff ff       	call   1393 <write>
    152e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1531:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1534:	0f b6 1e             	movzbl (%esi),%ebx
    1537:	83 c6 01             	add    $0x1,%esi
    153a:	84 db                	test   %bl,%bl
    153c:	74 71                	je     15af <printf+0xcf>
    c = fmt[i] & 0xff;
    153e:	0f be cb             	movsbl %bl,%ecx
    1541:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1544:	85 d2                	test   %edx,%edx
    1546:	74 c8                	je     1510 <printf+0x30>
      }
    } else if(state == '%'){
    1548:	83 fa 25             	cmp    $0x25,%edx
    154b:	75 e7                	jne    1534 <printf+0x54>
      if(c == 'd'){
    154d:	83 f8 64             	cmp    $0x64,%eax
    1550:	0f 84 9a 00 00 00    	je     15f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1556:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    155c:	83 f9 70             	cmp    $0x70,%ecx
    155f:	74 5f                	je     15c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1561:	83 f8 73             	cmp    $0x73,%eax
    1564:	0f 84 d6 00 00 00    	je     1640 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    156a:	83 f8 63             	cmp    $0x63,%eax
    156d:	0f 84 8d 00 00 00    	je     1600 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1573:	83 f8 25             	cmp    $0x25,%eax
    1576:	0f 84 b4 00 00 00    	je     1630 <printf+0x150>
  write(fd, &c, 1);
    157c:	83 ec 04             	sub    $0x4,%esp
    157f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1583:	6a 01                	push   $0x1
    1585:	57                   	push   %edi
    1586:	ff 75 08             	pushl  0x8(%ebp)
    1589:	e8 05 fe ff ff       	call   1393 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    158e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1591:	83 c4 0c             	add    $0xc,%esp
    1594:	6a 01                	push   $0x1
    1596:	83 c6 01             	add    $0x1,%esi
    1599:	57                   	push   %edi
    159a:	ff 75 08             	pushl  0x8(%ebp)
    159d:	e8 f1 fd ff ff       	call   1393 <write>
  for(i = 0; fmt[i]; i++){
    15a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    15a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    15a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    15ab:	84 db                	test   %bl,%bl
    15ad:	75 8f                	jne    153e <printf+0x5e>
    }
  }
}
    15af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15b2:	5b                   	pop    %ebx
    15b3:	5e                   	pop    %esi
    15b4:	5f                   	pop    %edi
    15b5:	5d                   	pop    %ebp
    15b6:	c3                   	ret    
    15b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15c0:	83 ec 0c             	sub    $0xc,%esp
    15c3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15c8:	6a 00                	push   $0x0
    15ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15cd:	8b 45 08             	mov    0x8(%ebp),%eax
    15d0:	8b 13                	mov    (%ebx),%edx
    15d2:	e8 59 fe ff ff       	call   1430 <printint>
        ap++;
    15d7:	89 d8                	mov    %ebx,%eax
    15d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15dc:	31 d2                	xor    %edx,%edx
        ap++;
    15de:	83 c0 04             	add    $0x4,%eax
    15e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15e4:	e9 4b ff ff ff       	jmp    1534 <printf+0x54>
    15e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    15f0:	83 ec 0c             	sub    $0xc,%esp
    15f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15f8:	6a 01                	push   $0x1
    15fa:	eb ce                	jmp    15ca <printf+0xea>
    15fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1600:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1603:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1606:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1608:	6a 01                	push   $0x1
        ap++;
    160a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    160d:	57                   	push   %edi
    160e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1611:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1614:	e8 7a fd ff ff       	call   1393 <write>
        ap++;
    1619:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    161c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    161f:	31 d2                	xor    %edx,%edx
    1621:	e9 0e ff ff ff       	jmp    1534 <printf+0x54>
    1626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    162d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1630:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1633:	83 ec 04             	sub    $0x4,%esp
    1636:	e9 59 ff ff ff       	jmp    1594 <printf+0xb4>
    163b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    163f:	90                   	nop
        s = (char*)*ap;
    1640:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1643:	8b 18                	mov    (%eax),%ebx
        ap++;
    1645:	83 c0 04             	add    $0x4,%eax
    1648:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    164b:	85 db                	test   %ebx,%ebx
    164d:	74 17                	je     1666 <printf+0x186>
        while(*s != 0){
    164f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1652:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1654:	84 c0                	test   %al,%al
    1656:	0f 84 d8 fe ff ff    	je     1534 <printf+0x54>
    165c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    165f:	89 de                	mov    %ebx,%esi
    1661:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1664:	eb 1a                	jmp    1680 <printf+0x1a0>
          s = "(null)";
    1666:	bb c0 18 00 00       	mov    $0x18c0,%ebx
        while(*s != 0){
    166b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    166e:	b8 28 00 00 00       	mov    $0x28,%eax
    1673:	89 de                	mov    %ebx,%esi
    1675:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1678:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    167f:	90                   	nop
  write(fd, &c, 1);
    1680:	83 ec 04             	sub    $0x4,%esp
          s++;
    1683:	83 c6 01             	add    $0x1,%esi
    1686:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1689:	6a 01                	push   $0x1
    168b:	57                   	push   %edi
    168c:	53                   	push   %ebx
    168d:	e8 01 fd ff ff       	call   1393 <write>
        while(*s != 0){
    1692:	0f b6 06             	movzbl (%esi),%eax
    1695:	83 c4 10             	add    $0x10,%esp
    1698:	84 c0                	test   %al,%al
    169a:	75 e4                	jne    1680 <printf+0x1a0>
    169c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    169f:	31 d2                	xor    %edx,%edx
    16a1:	e9 8e fe ff ff       	jmp    1534 <printf+0x54>
    16a6:	66 90                	xchg   %ax,%ax
    16a8:	66 90                	xchg   %ax,%ax
    16aa:	66 90                	xchg   %ax,%ax
    16ac:	66 90                	xchg   %ax,%ax
    16ae:	66 90                	xchg   %ax,%ax

000016b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16b0:	f3 0f 1e fb          	endbr32 
    16b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b5:	a1 00 1c 00 00       	mov    0x1c00,%eax
{
    16ba:	89 e5                	mov    %esp,%ebp
    16bc:	57                   	push   %edi
    16bd:	56                   	push   %esi
    16be:	53                   	push   %ebx
    16bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    16c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c7:	39 c8                	cmp    %ecx,%eax
    16c9:	73 15                	jae    16e0 <free+0x30>
    16cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16cf:	90                   	nop
    16d0:	39 d1                	cmp    %edx,%ecx
    16d2:	72 14                	jb     16e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d4:	39 d0                	cmp    %edx,%eax
    16d6:	73 10                	jae    16e8 <free+0x38>
{
    16d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16da:	8b 10                	mov    (%eax),%edx
    16dc:	39 c8                	cmp    %ecx,%eax
    16de:	72 f0                	jb     16d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16e0:	39 d0                	cmp    %edx,%eax
    16e2:	72 f4                	jb     16d8 <free+0x28>
    16e4:	39 d1                	cmp    %edx,%ecx
    16e6:	73 f0                	jae    16d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ee:	39 fa                	cmp    %edi,%edx
    16f0:	74 1e                	je     1710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16f5:	8b 50 04             	mov    0x4(%eax),%edx
    16f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16fb:	39 f1                	cmp    %esi,%ecx
    16fd:	74 28                	je     1727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1701:	5b                   	pop    %ebx
  freep = p;
    1702:	a3 00 1c 00 00       	mov    %eax,0x1c00
}
    1707:	5e                   	pop    %esi
    1708:	5f                   	pop    %edi
    1709:	5d                   	pop    %ebp
    170a:	c3                   	ret    
    170b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    170f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1710:	03 72 04             	add    0x4(%edx),%esi
    1713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1716:	8b 10                	mov    (%eax),%edx
    1718:	8b 12                	mov    (%edx),%edx
    171a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    171d:	8b 50 04             	mov    0x4(%eax),%edx
    1720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1723:	39 f1                	cmp    %esi,%ecx
    1725:	75 d8                	jne    16ff <free+0x4f>
    p->s.size += bp->s.size;
    1727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    172a:	a3 00 1c 00 00       	mov    %eax,0x1c00
    p->s.size += bp->s.size;
    172f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1732:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1735:	89 10                	mov    %edx,(%eax)
}
    1737:	5b                   	pop    %ebx
    1738:	5e                   	pop    %esi
    1739:	5f                   	pop    %edi
    173a:	5d                   	pop    %ebp
    173b:	c3                   	ret    
    173c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1740:	f3 0f 1e fb          	endbr32 
    1744:	55                   	push   %ebp
    1745:	89 e5                	mov    %esp,%ebp
    1747:	57                   	push   %edi
    1748:	56                   	push   %esi
    1749:	53                   	push   %ebx
    174a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    174d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1750:	8b 3d 00 1c 00 00    	mov    0x1c00,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1756:	8d 70 07             	lea    0x7(%eax),%esi
    1759:	c1 ee 03             	shr    $0x3,%esi
    175c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    175f:	85 ff                	test   %edi,%edi
    1761:	0f 84 a9 00 00 00    	je     1810 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1767:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1769:	8b 48 04             	mov    0x4(%eax),%ecx
    176c:	39 f1                	cmp    %esi,%ecx
    176e:	73 6d                	jae    17dd <malloc+0x9d>
    1770:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1776:	bb 00 10 00 00       	mov    $0x1000,%ebx
    177b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    177e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1785:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1788:	eb 17                	jmp    17a1 <malloc+0x61>
    178a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1790:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1792:	8b 4a 04             	mov    0x4(%edx),%ecx
    1795:	39 f1                	cmp    %esi,%ecx
    1797:	73 4f                	jae    17e8 <malloc+0xa8>
    1799:	8b 3d 00 1c 00 00    	mov    0x1c00,%edi
    179f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    17a1:	39 c7                	cmp    %eax,%edi
    17a3:	75 eb                	jne    1790 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    17a5:	83 ec 0c             	sub    $0xc,%esp
    17a8:	ff 75 e4             	pushl  -0x1c(%ebp)
    17ab:	e8 4b fc ff ff       	call   13fb <sbrk>
  if(p == (char*)-1)
    17b0:	83 c4 10             	add    $0x10,%esp
    17b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    17b6:	74 1b                	je     17d3 <malloc+0x93>
  hp->s.size = nu;
    17b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17bb:	83 ec 0c             	sub    $0xc,%esp
    17be:	83 c0 08             	add    $0x8,%eax
    17c1:	50                   	push   %eax
    17c2:	e8 e9 fe ff ff       	call   16b0 <free>
  return freep;
    17c7:	a1 00 1c 00 00       	mov    0x1c00,%eax
      if((p = morecore(nunits)) == 0)
    17cc:	83 c4 10             	add    $0x10,%esp
    17cf:	85 c0                	test   %eax,%eax
    17d1:	75 bd                	jne    1790 <malloc+0x50>
        return 0;
  }
}
    17d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17d6:	31 c0                	xor    %eax,%eax
}
    17d8:	5b                   	pop    %ebx
    17d9:	5e                   	pop    %esi
    17da:	5f                   	pop    %edi
    17db:	5d                   	pop    %ebp
    17dc:	c3                   	ret    
    if(p->s.size >= nunits){
    17dd:	89 c2                	mov    %eax,%edx
    17df:	89 f8                	mov    %edi,%eax
    17e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17e8:	39 ce                	cmp    %ecx,%esi
    17ea:	74 54                	je     1840 <malloc+0x100>
        p->s.size -= nunits;
    17ec:	29 f1                	sub    %esi,%ecx
    17ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    17f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    17f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    17f7:	a3 00 1c 00 00       	mov    %eax,0x1c00
}
    17fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17ff:	8d 42 08             	lea    0x8(%edx),%eax
}
    1802:	5b                   	pop    %ebx
    1803:	5e                   	pop    %esi
    1804:	5f                   	pop    %edi
    1805:	5d                   	pop    %ebp
    1806:	c3                   	ret    
    1807:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    180e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1810:	c7 05 00 1c 00 00 04 	movl   $0x1c04,0x1c00
    1817:	1c 00 00 
    base.s.size = 0;
    181a:	bf 04 1c 00 00       	mov    $0x1c04,%edi
    base.s.ptr = freep = prevp = &base;
    181f:	c7 05 04 1c 00 00 04 	movl   $0x1c04,0x1c04
    1826:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1829:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    182b:	c7 05 08 1c 00 00 00 	movl   $0x0,0x1c08
    1832:	00 00 00 
    if(p->s.size >= nunits){
    1835:	e9 36 ff ff ff       	jmp    1770 <malloc+0x30>
    183a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1840:	8b 0a                	mov    (%edx),%ecx
    1842:	89 08                	mov    %ecx,(%eax)
    1844:	eb b1                	jmp    17f7 <malloc+0xb7>
    1846:	66 90                	xchg   %ax,%ax
    1848:	66 90                	xchg   %ax,%ax
    184a:	66 90                	xchg   %ax,%ax
    184c:	66 90                	xchg   %ax,%ax
    184e:	66 90                	xchg   %ax,%ax

00001850 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1850:	f3 0f 1e fb          	endbr32 
    1854:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1855:	b9 01 00 00 00       	mov    $0x1,%ecx
    185a:	89 e5                	mov    %esp,%ebp
    185c:	8b 55 08             	mov    0x8(%ebp),%edx
    185f:	90                   	nop
    1860:	89 c8                	mov    %ecx,%eax
    1862:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1865:	85 c0                	test   %eax,%eax
    1867:	75 f7                	jne    1860 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1869:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    186e:	5d                   	pop    %ebp
    186f:	c3                   	ret    

00001870 <urelease>:

void urelease (struct uspinlock *lk) {
    1870:	f3 0f 1e fb          	endbr32 
    1874:	55                   	push   %ebp
    1875:	89 e5                	mov    %esp,%ebp
    1877:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    187a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    187f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1885:	5d                   	pop    %ebp
    1886:	c3                   	ret    
