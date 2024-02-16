
_shm_cnt:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
   struct uspinlock lock;
   int cnt;
};

int main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	57                   	push   %edi
    1012:	56                   	push   %esi
    1013:	53                   	push   %ebx
    1014:	51                   	push   %ecx
    1015:	83 ec 18             	sub    $0x18,%esp

int pid;
int i=0;
struct shm_cnt *counter;
  pid=fork();
    1018:	e8 3e 03 00 00       	call   135b <fork>
  sleep(1);
    101d:	83 ec 0c             	sub    $0xc,%esp
    1020:	6a 01                	push   $0x1
  pid=fork();
    1022:	89 c7                	mov    %eax,%edi
  sleep(1);
    1024:	e8 ca 03 00 00       	call   13f3 <sleep>

//shm_open: first process will create the page, the second will just attach to the same page
//we get the virtual address of the page returned into counter
//which we can now use but will be shared between the two processes
  
shm_open(1,(char **)&counter);
    1029:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    102c:	5b                   	pop    %ebx
    102d:	5e                   	pop    %esi
    102e:	50                   	push   %eax
    102f:	be 7d 18 00 00       	mov    $0x187d,%esi
    1034:	6a 01                	push   $0x1
    1036:	e8 c8 03 00 00       	call   1403 <shm_open>
printf(1 , "Here");
    103b:	58                   	pop    %eax
    103c:	5a                   	pop    %edx
    103d:	68 78 18 00 00       	push   $0x1878
    1042:	6a 01                	push   $0x1
    1044:	e8 87 04 00 00       	call   14d0 <printf>
 
//  printf(1,"%s returned successfully from shm_open with counter %x\n", pid? "Child": "Parent", counter); 
  for(i = 0; i < 10000; i++)
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	b8 84 18 00 00       	mov    $0x1884,%eax
    1051:	85 ff                	test   %edi,%edi
    1053:	0f 44 f0             	cmove  %eax,%esi
    1056:	31 db                	xor    %ebx,%ebx
    1058:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105f:	90                   	nop
    {
        uacquire(&(counter->lock));
    1060:	83 ec 0c             	sub    $0xc,%esp
    1063:	ff 75 e4             	pushl  -0x1c(%ebp)
    1066:	e8 d5 07 00 00       	call   1840 <uacquire>
        counter->cnt++;
    106b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    106e:	83 40 04 01          	addl   $0x1,0x4(%eax)
        urelease(&(counter->lock));
    1072:	89 04 24             	mov    %eax,(%esp)
    1075:	e8 e6 07 00 00       	call   1860 <urelease>
    107a:	69 c3 d5 78 e9 26    	imul   $0x26e978d5,%ebx,%eax
    1080:	83 c4 10             	add    $0x10,%esp
    1083:	c1 c8 03             	ror    $0x3,%eax

    //print something because we are curious and to give a chance to switch process
        if(i%1000 == 0)
    1086:	3d 37 89 41 00       	cmp    $0x418937,%eax
    108b:	77 1a                	ja     10a7 <main+0xa7>
          printf(1,"Counter in %s is %d at address %x\n",pid? "Parent" : "Child", counter->cnt, counter);
    108d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1090:	83 ec 0c             	sub    $0xc,%esp
    1093:	50                   	push   %eax
    1094:	ff 70 04             	pushl  0x4(%eax)
    1097:	56                   	push   %esi
    1098:	68 bc 18 00 00       	push   $0x18bc
    109d:	6a 01                	push   $0x1
    109f:	e8 2c 04 00 00       	call   14d0 <printf>
    10a4:	83 c4 20             	add    $0x20,%esp
  for(i = 0; i < 10000; i++)
    10a7:	83 c3 01             	add    $0x1,%ebx
    10aa:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    10b0:	75 ae                	jne    1060 <main+0x60>
    }
  
  if(pid)
    10b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10b5:	8b 40 04             	mov    0x4(%eax),%eax
    10b8:	85 ff                	test   %edi,%edi
    10ba:	74 25                	je     10e1 <main+0xe1>
     {
       printf(1,"Counter in parent is %d\n",counter->cnt);
    10bc:	51                   	push   %ecx
    10bd:	50                   	push   %eax
    10be:	68 8a 18 00 00       	push   $0x188a
    10c3:	6a 01                	push   $0x1
    10c5:	e8 06 04 00 00       	call   14d0 <printf>
    wait();
    10ca:	e8 9c 02 00 00       	call   136b <wait>
    10cf:	83 c4 10             	add    $0x10,%esp
    } else
    printf(1,"Counter in child is %d\n\n",counter->cnt);

//shm_close: first process will just detach, next one will free up the shm_table entry (but for now not the page)
   shm_close(1);
    10d2:	83 ec 0c             	sub    $0xc,%esp
    10d5:	6a 01                	push   $0x1
    10d7:	e8 2f 03 00 00       	call   140b <shm_close>
   exit();
    10dc:	e8 82 02 00 00       	call   1363 <exit>
    printf(1,"Counter in child is %d\n\n",counter->cnt);
    10e1:	52                   	push   %edx
    10e2:	50                   	push   %eax
    10e3:	68 a3 18 00 00       	push   $0x18a3
    10e8:	6a 01                	push   $0x1
    10ea:	e8 e1 03 00 00       	call   14d0 <printf>
    10ef:	83 c4 10             	add    $0x10,%esp
    10f2:	eb de                	jmp    10d2 <main+0xd2>
    10f4:	66 90                	xchg   %ax,%ax
    10f6:	66 90                	xchg   %ax,%ax
    10f8:	66 90                	xchg   %ax,%ax
    10fa:	66 90                	xchg   %ax,%ax
    10fc:	66 90                	xchg   %ax,%ax
    10fe:	66 90                	xchg   %ax,%ax

00001100 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1100:	f3 0f 1e fb          	endbr32 
    1104:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1105:	31 c0                	xor    %eax,%eax
{
    1107:	89 e5                	mov    %esp,%ebp
    1109:	53                   	push   %ebx
    110a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    110d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1110:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1114:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1117:	83 c0 01             	add    $0x1,%eax
    111a:	84 d2                	test   %dl,%dl
    111c:	75 f2                	jne    1110 <strcpy+0x10>
    ;
  return os;
}
    111e:	89 c8                	mov    %ecx,%eax
    1120:	5b                   	pop    %ebx
    1121:	5d                   	pop    %ebp
    1122:	c3                   	ret    
    1123:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001130 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1130:	f3 0f 1e fb          	endbr32 
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	53                   	push   %ebx
    1138:	8b 4d 08             	mov    0x8(%ebp),%ecx
    113b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    113e:	0f b6 01             	movzbl (%ecx),%eax
    1141:	0f b6 1a             	movzbl (%edx),%ebx
    1144:	84 c0                	test   %al,%al
    1146:	75 19                	jne    1161 <strcmp+0x31>
    1148:	eb 26                	jmp    1170 <strcmp+0x40>
    114a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1150:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1154:	83 c1 01             	add    $0x1,%ecx
    1157:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    115a:	0f b6 1a             	movzbl (%edx),%ebx
    115d:	84 c0                	test   %al,%al
    115f:	74 0f                	je     1170 <strcmp+0x40>
    1161:	38 d8                	cmp    %bl,%al
    1163:	74 eb                	je     1150 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1165:	29 d8                	sub    %ebx,%eax
}
    1167:	5b                   	pop    %ebx
    1168:	5d                   	pop    %ebp
    1169:	c3                   	ret    
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1170:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1172:	29 d8                	sub    %ebx,%eax
}
    1174:	5b                   	pop    %ebx
    1175:	5d                   	pop    %ebp
    1176:	c3                   	ret    
    1177:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117e:	66 90                	xchg   %ax,%ax

00001180 <strlen>:

uint
strlen(char *s)
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    118a:	80 3a 00             	cmpb   $0x0,(%edx)
    118d:	74 21                	je     11b0 <strlen+0x30>
    118f:	31 c0                	xor    %eax,%eax
    1191:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1198:	83 c0 01             	add    $0x1,%eax
    119b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    119f:	89 c1                	mov    %eax,%ecx
    11a1:	75 f5                	jne    1198 <strlen+0x18>
    ;
  return n;
}
    11a3:	89 c8                	mov    %ecx,%eax
    11a5:	5d                   	pop    %ebp
    11a6:	c3                   	ret    
    11a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ae:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    11b0:	31 c9                	xor    %ecx,%ecx
}
    11b2:	5d                   	pop    %ebp
    11b3:	89 c8                	mov    %ecx,%eax
    11b5:	c3                   	ret    
    11b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11bd:	8d 76 00             	lea    0x0(%esi),%esi

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	f3 0f 1e fb          	endbr32 
    11c4:	55                   	push   %ebp
    11c5:	89 e5                	mov    %esp,%ebp
    11c7:	57                   	push   %edi
    11c8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d1:	89 d7                	mov    %edx,%edi
    11d3:	fc                   	cld    
    11d4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d6:	89 d0                	mov    %edx,%eax
    11d8:	5f                   	pop    %edi
    11d9:	5d                   	pop    %ebp
    11da:	c3                   	ret    
    11db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11df:	90                   	nop

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	f3 0f 1e fb          	endbr32 
    11e4:	55                   	push   %ebp
    11e5:	89 e5                	mov    %esp,%ebp
    11e7:	8b 45 08             	mov    0x8(%ebp),%eax
    11ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11ee:	0f b6 10             	movzbl (%eax),%edx
    11f1:	84 d2                	test   %dl,%dl
    11f3:	75 16                	jne    120b <strchr+0x2b>
    11f5:	eb 21                	jmp    1218 <strchr+0x38>
    11f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11fe:	66 90                	xchg   %ax,%ax
    1200:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	84 d2                	test   %dl,%dl
    1209:	74 0d                	je     1218 <strchr+0x38>
    if(*s == c)
    120b:	38 d1                	cmp    %dl,%cl
    120d:	75 f1                	jne    1200 <strchr+0x20>
      return (char*)s;
  return 0;
}
    120f:	5d                   	pop    %ebp
    1210:	c3                   	ret    
    1211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1218:	31 c0                	xor    %eax,%eax
}
    121a:	5d                   	pop    %ebp
    121b:	c3                   	ret    
    121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	f3 0f 1e fb          	endbr32 
    1224:	55                   	push   %ebp
    1225:	89 e5                	mov    %esp,%ebp
    1227:	57                   	push   %edi
    1228:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1229:	31 f6                	xor    %esi,%esi
{
    122b:	53                   	push   %ebx
    122c:	89 f3                	mov    %esi,%ebx
    122e:	83 ec 1c             	sub    $0x1c,%esp
    1231:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1234:	eb 33                	jmp    1269 <gets+0x49>
    1236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1240:	83 ec 04             	sub    $0x4,%esp
    1243:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1246:	6a 01                	push   $0x1
    1248:	50                   	push   %eax
    1249:	6a 00                	push   $0x0
    124b:	e8 2b 01 00 00       	call   137b <read>
    if(cc < 1)
    1250:	83 c4 10             	add    $0x10,%esp
    1253:	85 c0                	test   %eax,%eax
    1255:	7e 1c                	jle    1273 <gets+0x53>
      break;
    buf[i++] = c;
    1257:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    125b:	83 c7 01             	add    $0x1,%edi
    125e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1261:	3c 0a                	cmp    $0xa,%al
    1263:	74 23                	je     1288 <gets+0x68>
    1265:	3c 0d                	cmp    $0xd,%al
    1267:	74 1f                	je     1288 <gets+0x68>
  for(i=0; i+1 < max; ){
    1269:	83 c3 01             	add    $0x1,%ebx
    126c:	89 fe                	mov    %edi,%esi
    126e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1271:	7c cd                	jl     1240 <gets+0x20>
    1273:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1275:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1278:	c6 03 00             	movb   $0x0,(%ebx)
}
    127b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    127e:	5b                   	pop    %ebx
    127f:	5e                   	pop    %esi
    1280:	5f                   	pop    %edi
    1281:	5d                   	pop    %ebp
    1282:	c3                   	ret    
    1283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1287:	90                   	nop
    1288:	8b 75 08             	mov    0x8(%ebp),%esi
    128b:	8b 45 08             	mov    0x8(%ebp),%eax
    128e:	01 de                	add    %ebx,%esi
    1290:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1292:	c6 03 00             	movb   $0x0,(%ebx)
}
    1295:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1298:	5b                   	pop    %ebx
    1299:	5e                   	pop    %esi
    129a:	5f                   	pop    %edi
    129b:	5d                   	pop    %ebp
    129c:	c3                   	ret    
    129d:	8d 76 00             	lea    0x0(%esi),%esi

000012a0 <stat>:

int
stat(char *n, struct stat *st)
{
    12a0:	f3 0f 1e fb          	endbr32 
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	56                   	push   %esi
    12a8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12a9:	83 ec 08             	sub    $0x8,%esp
    12ac:	6a 00                	push   $0x0
    12ae:	ff 75 08             	pushl  0x8(%ebp)
    12b1:	e8 ed 00 00 00       	call   13a3 <open>
  if(fd < 0)
    12b6:	83 c4 10             	add    $0x10,%esp
    12b9:	85 c0                	test   %eax,%eax
    12bb:	78 2b                	js     12e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12bd:	83 ec 08             	sub    $0x8,%esp
    12c0:	ff 75 0c             	pushl  0xc(%ebp)
    12c3:	89 c3                	mov    %eax,%ebx
    12c5:	50                   	push   %eax
    12c6:	e8 f0 00 00 00       	call   13bb <fstat>
  close(fd);
    12cb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12ce:	89 c6                	mov    %eax,%esi
  close(fd);
    12d0:	e8 b6 00 00 00       	call   138b <close>
  return r;
    12d5:	83 c4 10             	add    $0x10,%esp
}
    12d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12db:	89 f0                	mov    %esi,%eax
    12dd:	5b                   	pop    %ebx
    12de:	5e                   	pop    %esi
    12df:	5d                   	pop    %ebp
    12e0:	c3                   	ret    
    12e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12e8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12ed:	eb e9                	jmp    12d8 <stat+0x38>
    12ef:	90                   	nop

000012f0 <atoi>:

int
atoi(const char *s)
{
    12f0:	f3 0f 1e fb          	endbr32 
    12f4:	55                   	push   %ebp
    12f5:	89 e5                	mov    %esp,%ebp
    12f7:	53                   	push   %ebx
    12f8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12fb:	0f be 02             	movsbl (%edx),%eax
    12fe:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1301:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1304:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1309:	77 1a                	ja     1325 <atoi+0x35>
    130b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    130f:	90                   	nop
    n = n*10 + *s++ - '0';
    1310:	83 c2 01             	add    $0x1,%edx
    1313:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1316:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    131a:	0f be 02             	movsbl (%edx),%eax
    131d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1320:	80 fb 09             	cmp    $0x9,%bl
    1323:	76 eb                	jbe    1310 <atoi+0x20>
  return n;
}
    1325:	89 c8                	mov    %ecx,%eax
    1327:	5b                   	pop    %ebx
    1328:	5d                   	pop    %ebp
    1329:	c3                   	ret    
    132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001330 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1330:	f3 0f 1e fb          	endbr32 
    1334:	55                   	push   %ebp
    1335:	89 e5                	mov    %esp,%ebp
    1337:	57                   	push   %edi
    1338:	8b 45 10             	mov    0x10(%ebp),%eax
    133b:	8b 55 08             	mov    0x8(%ebp),%edx
    133e:	56                   	push   %esi
    133f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1342:	85 c0                	test   %eax,%eax
    1344:	7e 0f                	jle    1355 <memmove+0x25>
    1346:	01 d0                	add    %edx,%eax
  dst = vdst;
    1348:	89 d7                	mov    %edx,%edi
    134a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1350:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1351:	39 f8                	cmp    %edi,%eax
    1353:	75 fb                	jne    1350 <memmove+0x20>
  return vdst;
}
    1355:	5e                   	pop    %esi
    1356:	89 d0                	mov    %edx,%eax
    1358:	5f                   	pop    %edi
    1359:	5d                   	pop    %ebp
    135a:	c3                   	ret    

0000135b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    135b:	b8 01 00 00 00       	mov    $0x1,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <exit>:
SYSCALL(exit)
    1363:	b8 02 00 00 00       	mov    $0x2,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <wait>:
SYSCALL(wait)
    136b:	b8 03 00 00 00       	mov    $0x3,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <pipe>:
SYSCALL(pipe)
    1373:	b8 04 00 00 00       	mov    $0x4,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <read>:
SYSCALL(read)
    137b:	b8 05 00 00 00       	mov    $0x5,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <write>:
SYSCALL(write)
    1383:	b8 10 00 00 00       	mov    $0x10,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <close>:
SYSCALL(close)
    138b:	b8 15 00 00 00       	mov    $0x15,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <kill>:
SYSCALL(kill)
    1393:	b8 06 00 00 00       	mov    $0x6,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <exec>:
SYSCALL(exec)
    139b:	b8 07 00 00 00       	mov    $0x7,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <open>:
SYSCALL(open)
    13a3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <mknod>:
SYSCALL(mknod)
    13ab:	b8 11 00 00 00       	mov    $0x11,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <unlink>:
SYSCALL(unlink)
    13b3:	b8 12 00 00 00       	mov    $0x12,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <fstat>:
SYSCALL(fstat)
    13bb:	b8 08 00 00 00       	mov    $0x8,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <link>:
SYSCALL(link)
    13c3:	b8 13 00 00 00       	mov    $0x13,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <mkdir>:
SYSCALL(mkdir)
    13cb:	b8 14 00 00 00       	mov    $0x14,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <chdir>:
SYSCALL(chdir)
    13d3:	b8 09 00 00 00       	mov    $0x9,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <dup>:
SYSCALL(dup)
    13db:	b8 0a 00 00 00       	mov    $0xa,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <getpid>:
SYSCALL(getpid)
    13e3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <sbrk>:
SYSCALL(sbrk)
    13eb:	b8 0c 00 00 00       	mov    $0xc,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <sleep>:
SYSCALL(sleep)
    13f3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <uptime>:
SYSCALL(uptime)
    13fb:	b8 0e 00 00 00       	mov    $0xe,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <shm_open>:
SYSCALL(shm_open)
    1403:	b8 16 00 00 00       	mov    $0x16,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <shm_close>:
SYSCALL(shm_close)	
    140b:	b8 17 00 00 00       	mov    $0x17,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    
    1413:	66 90                	xchg   %ax,%ax
    1415:	66 90                	xchg   %ax,%ax
    1417:	66 90                	xchg   %ax,%ax
    1419:	66 90                	xchg   %ax,%ax
    141b:	66 90                	xchg   %ax,%ax
    141d:	66 90                	xchg   %ax,%ax
    141f:	90                   	nop

00001420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 3c             	sub    $0x3c,%esp
    1429:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    142c:	89 d1                	mov    %edx,%ecx
{
    142e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1431:	85 d2                	test   %edx,%edx
    1433:	0f 89 7f 00 00 00    	jns    14b8 <printint+0x98>
    1439:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    143d:	74 79                	je     14b8 <printint+0x98>
    neg = 1;
    143f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1446:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1448:	31 db                	xor    %ebx,%ebx
    144a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    144d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1450:	89 c8                	mov    %ecx,%eax
    1452:	31 d2                	xor    %edx,%edx
    1454:	89 cf                	mov    %ecx,%edi
    1456:	f7 75 c4             	divl   -0x3c(%ebp)
    1459:	0f b6 92 e8 18 00 00 	movzbl 0x18e8(%edx),%edx
    1460:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1463:	89 d8                	mov    %ebx,%eax
    1465:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1468:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    146b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    146e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1471:	76 dd                	jbe    1450 <printint+0x30>
  if(neg)
    1473:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1476:	85 c9                	test   %ecx,%ecx
    1478:	74 0c                	je     1486 <printint+0x66>
    buf[i++] = '-';
    147a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    147f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1481:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1486:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1489:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    148d:	eb 07                	jmp    1496 <printint+0x76>
    148f:	90                   	nop
    1490:	0f b6 13             	movzbl (%ebx),%edx
    1493:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1496:	83 ec 04             	sub    $0x4,%esp
    1499:	88 55 d7             	mov    %dl,-0x29(%ebp)
    149c:	6a 01                	push   $0x1
    149e:	56                   	push   %esi
    149f:	57                   	push   %edi
    14a0:	e8 de fe ff ff       	call   1383 <write>
  while(--i >= 0)
    14a5:	83 c4 10             	add    $0x10,%esp
    14a8:	39 de                	cmp    %ebx,%esi
    14aa:	75 e4                	jne    1490 <printint+0x70>
    putc(fd, buf[i]);
}
    14ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14af:	5b                   	pop    %ebx
    14b0:	5e                   	pop    %esi
    14b1:	5f                   	pop    %edi
    14b2:	5d                   	pop    %ebp
    14b3:	c3                   	ret    
    14b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14bf:	eb 87                	jmp    1448 <printint+0x28>
    14c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14cf:	90                   	nop

000014d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14d0:	f3 0f 1e fb          	endbr32 
    14d4:	55                   	push   %ebp
    14d5:	89 e5                	mov    %esp,%ebp
    14d7:	57                   	push   %edi
    14d8:	56                   	push   %esi
    14d9:	53                   	push   %ebx
    14da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14dd:	8b 75 0c             	mov    0xc(%ebp),%esi
    14e0:	0f b6 1e             	movzbl (%esi),%ebx
    14e3:	84 db                	test   %bl,%bl
    14e5:	0f 84 b4 00 00 00    	je     159f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    14eb:	8d 45 10             	lea    0x10(%ebp),%eax
    14ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    14f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    14f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14f9:	eb 33                	jmp    152e <printf+0x5e>
    14fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14ff:	90                   	nop
    1500:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1503:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1508:	83 f8 25             	cmp    $0x25,%eax
    150b:	74 17                	je     1524 <printf+0x54>
  write(fd, &c, 1);
    150d:	83 ec 04             	sub    $0x4,%esp
    1510:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1513:	6a 01                	push   $0x1
    1515:	57                   	push   %edi
    1516:	ff 75 08             	pushl  0x8(%ebp)
    1519:	e8 65 fe ff ff       	call   1383 <write>
    151e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1521:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1524:	0f b6 1e             	movzbl (%esi),%ebx
    1527:	83 c6 01             	add    $0x1,%esi
    152a:	84 db                	test   %bl,%bl
    152c:	74 71                	je     159f <printf+0xcf>
    c = fmt[i] & 0xff;
    152e:	0f be cb             	movsbl %bl,%ecx
    1531:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1534:	85 d2                	test   %edx,%edx
    1536:	74 c8                	je     1500 <printf+0x30>
      }
    } else if(state == '%'){
    1538:	83 fa 25             	cmp    $0x25,%edx
    153b:	75 e7                	jne    1524 <printf+0x54>
      if(c == 'd'){
    153d:	83 f8 64             	cmp    $0x64,%eax
    1540:	0f 84 9a 00 00 00    	je     15e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1546:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    154c:	83 f9 70             	cmp    $0x70,%ecx
    154f:	74 5f                	je     15b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1551:	83 f8 73             	cmp    $0x73,%eax
    1554:	0f 84 d6 00 00 00    	je     1630 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    155a:	83 f8 63             	cmp    $0x63,%eax
    155d:	0f 84 8d 00 00 00    	je     15f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1563:	83 f8 25             	cmp    $0x25,%eax
    1566:	0f 84 b4 00 00 00    	je     1620 <printf+0x150>
  write(fd, &c, 1);
    156c:	83 ec 04             	sub    $0x4,%esp
    156f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1573:	6a 01                	push   $0x1
    1575:	57                   	push   %edi
    1576:	ff 75 08             	pushl  0x8(%ebp)
    1579:	e8 05 fe ff ff       	call   1383 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    157e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1581:	83 c4 0c             	add    $0xc,%esp
    1584:	6a 01                	push   $0x1
    1586:	83 c6 01             	add    $0x1,%esi
    1589:	57                   	push   %edi
    158a:	ff 75 08             	pushl  0x8(%ebp)
    158d:	e8 f1 fd ff ff       	call   1383 <write>
  for(i = 0; fmt[i]; i++){
    1592:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1596:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1599:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    159b:	84 db                	test   %bl,%bl
    159d:	75 8f                	jne    152e <printf+0x5e>
    }
  }
}
    159f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    15a2:	5b                   	pop    %ebx
    15a3:	5e                   	pop    %esi
    15a4:	5f                   	pop    %edi
    15a5:	5d                   	pop    %ebp
    15a6:	c3                   	ret    
    15a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15b8:	6a 00                	push   $0x0
    15ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15bd:	8b 45 08             	mov    0x8(%ebp),%eax
    15c0:	8b 13                	mov    (%ebx),%edx
    15c2:	e8 59 fe ff ff       	call   1420 <printint>
        ap++;
    15c7:	89 d8                	mov    %ebx,%eax
    15c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15cc:	31 d2                	xor    %edx,%edx
        ap++;
    15ce:	83 c0 04             	add    $0x4,%eax
    15d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15d4:	e9 4b ff ff ff       	jmp    1524 <printf+0x54>
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    15e0:	83 ec 0c             	sub    $0xc,%esp
    15e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15e8:	6a 01                	push   $0x1
    15ea:	eb ce                	jmp    15ba <printf+0xea>
    15ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    15f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    15f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    15f8:	6a 01                	push   $0x1
        ap++;
    15fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    15fd:	57                   	push   %edi
    15fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1601:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1604:	e8 7a fd ff ff       	call   1383 <write>
        ap++;
    1609:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    160c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    160f:	31 d2                	xor    %edx,%edx
    1611:	e9 0e ff ff ff       	jmp    1524 <printf+0x54>
    1616:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    161d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1620:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1623:	83 ec 04             	sub    $0x4,%esp
    1626:	e9 59 ff ff ff       	jmp    1584 <printf+0xb4>
    162b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
        s = (char*)*ap;
    1630:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1633:	8b 18                	mov    (%eax),%ebx
        ap++;
    1635:	83 c0 04             	add    $0x4,%eax
    1638:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    163b:	85 db                	test   %ebx,%ebx
    163d:	74 17                	je     1656 <printf+0x186>
        while(*s != 0){
    163f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1642:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1644:	84 c0                	test   %al,%al
    1646:	0f 84 d8 fe ff ff    	je     1524 <printf+0x54>
    164c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    164f:	89 de                	mov    %ebx,%esi
    1651:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1654:	eb 1a                	jmp    1670 <printf+0x1a0>
          s = "(null)";
    1656:	bb df 18 00 00       	mov    $0x18df,%ebx
        while(*s != 0){
    165b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    165e:	b8 28 00 00 00       	mov    $0x28,%eax
    1663:	89 de                	mov    %ebx,%esi
    1665:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    166f:	90                   	nop
  write(fd, &c, 1);
    1670:	83 ec 04             	sub    $0x4,%esp
          s++;
    1673:	83 c6 01             	add    $0x1,%esi
    1676:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1679:	6a 01                	push   $0x1
    167b:	57                   	push   %edi
    167c:	53                   	push   %ebx
    167d:	e8 01 fd ff ff       	call   1383 <write>
        while(*s != 0){
    1682:	0f b6 06             	movzbl (%esi),%eax
    1685:	83 c4 10             	add    $0x10,%esp
    1688:	84 c0                	test   %al,%al
    168a:	75 e4                	jne    1670 <printf+0x1a0>
    168c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    168f:	31 d2                	xor    %edx,%edx
    1691:	e9 8e fe ff ff       	jmp    1524 <printf+0x54>
    1696:	66 90                	xchg   %ax,%ax
    1698:	66 90                	xchg   %ax,%ax
    169a:	66 90                	xchg   %ax,%ax
    169c:	66 90                	xchg   %ax,%ax
    169e:	66 90                	xchg   %ax,%ax

000016a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16a0:	f3 0f 1e fb          	endbr32 
    16a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a5:	a1 dc 1b 00 00       	mov    0x1bdc,%eax
{
    16aa:	89 e5                	mov    %esp,%ebp
    16ac:	57                   	push   %edi
    16ad:	56                   	push   %esi
    16ae:	53                   	push   %ebx
    16af:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    16b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b7:	39 c8                	cmp    %ecx,%eax
    16b9:	73 15                	jae    16d0 <free+0x30>
    16bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16bf:	90                   	nop
    16c0:	39 d1                	cmp    %edx,%ecx
    16c2:	72 14                	jb     16d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c4:	39 d0                	cmp    %edx,%eax
    16c6:	73 10                	jae    16d8 <free+0x38>
{
    16c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16ca:	8b 10                	mov    (%eax),%edx
    16cc:	39 c8                	cmp    %ecx,%eax
    16ce:	72 f0                	jb     16c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16d0:	39 d0                	cmp    %edx,%eax
    16d2:	72 f4                	jb     16c8 <free+0x28>
    16d4:	39 d1                	cmp    %edx,%ecx
    16d6:	73 f0                	jae    16c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16de:	39 fa                	cmp    %edi,%edx
    16e0:	74 1e                	je     1700 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16e5:	8b 50 04             	mov    0x4(%eax),%edx
    16e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16eb:	39 f1                	cmp    %esi,%ecx
    16ed:	74 28                	je     1717 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    16f1:	5b                   	pop    %ebx
  freep = p;
    16f2:	a3 dc 1b 00 00       	mov    %eax,0x1bdc
}
    16f7:	5e                   	pop    %esi
    16f8:	5f                   	pop    %edi
    16f9:	5d                   	pop    %ebp
    16fa:	c3                   	ret    
    16fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1700:	03 72 04             	add    0x4(%edx),%esi
    1703:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1706:	8b 10                	mov    (%eax),%edx
    1708:	8b 12                	mov    (%edx),%edx
    170a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    170d:	8b 50 04             	mov    0x4(%eax),%edx
    1710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1713:	39 f1                	cmp    %esi,%ecx
    1715:	75 d8                	jne    16ef <free+0x4f>
    p->s.size += bp->s.size;
    1717:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    171a:	a3 dc 1b 00 00       	mov    %eax,0x1bdc
    p->s.size += bp->s.size;
    171f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1722:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1725:	89 10                	mov    %edx,(%eax)
}
    1727:	5b                   	pop    %ebx
    1728:	5e                   	pop    %esi
    1729:	5f                   	pop    %edi
    172a:	5d                   	pop    %ebp
    172b:	c3                   	ret    
    172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1730:	f3 0f 1e fb          	endbr32 
    1734:	55                   	push   %ebp
    1735:	89 e5                	mov    %esp,%ebp
    1737:	57                   	push   %edi
    1738:	56                   	push   %esi
    1739:	53                   	push   %ebx
    173a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    173d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1740:	8b 3d dc 1b 00 00    	mov    0x1bdc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1746:	8d 70 07             	lea    0x7(%eax),%esi
    1749:	c1 ee 03             	shr    $0x3,%esi
    174c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    174f:	85 ff                	test   %edi,%edi
    1751:	0f 84 a9 00 00 00    	je     1800 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1757:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1759:	8b 48 04             	mov    0x4(%eax),%ecx
    175c:	39 f1                	cmp    %esi,%ecx
    175e:	73 6d                	jae    17cd <malloc+0x9d>
    1760:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1766:	bb 00 10 00 00       	mov    $0x1000,%ebx
    176b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    176e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1775:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1778:	eb 17                	jmp    1791 <malloc+0x61>
    177a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1780:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1782:	8b 4a 04             	mov    0x4(%edx),%ecx
    1785:	39 f1                	cmp    %esi,%ecx
    1787:	73 4f                	jae    17d8 <malloc+0xa8>
    1789:	8b 3d dc 1b 00 00    	mov    0x1bdc,%edi
    178f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1791:	39 c7                	cmp    %eax,%edi
    1793:	75 eb                	jne    1780 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1795:	83 ec 0c             	sub    $0xc,%esp
    1798:	ff 75 e4             	pushl  -0x1c(%ebp)
    179b:	e8 4b fc ff ff       	call   13eb <sbrk>
  if(p == (char*)-1)
    17a0:	83 c4 10             	add    $0x10,%esp
    17a3:	83 f8 ff             	cmp    $0xffffffff,%eax
    17a6:	74 1b                	je     17c3 <malloc+0x93>
  hp->s.size = nu;
    17a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    17ab:	83 ec 0c             	sub    $0xc,%esp
    17ae:	83 c0 08             	add    $0x8,%eax
    17b1:	50                   	push   %eax
    17b2:	e8 e9 fe ff ff       	call   16a0 <free>
  return freep;
    17b7:	a1 dc 1b 00 00       	mov    0x1bdc,%eax
      if((p = morecore(nunits)) == 0)
    17bc:	83 c4 10             	add    $0x10,%esp
    17bf:	85 c0                	test   %eax,%eax
    17c1:	75 bd                	jne    1780 <malloc+0x50>
        return 0;
  }
}
    17c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17c6:	31 c0                	xor    %eax,%eax
}
    17c8:	5b                   	pop    %ebx
    17c9:	5e                   	pop    %esi
    17ca:	5f                   	pop    %edi
    17cb:	5d                   	pop    %ebp
    17cc:	c3                   	ret    
    if(p->s.size >= nunits){
    17cd:	89 c2                	mov    %eax,%edx
    17cf:	89 f8                	mov    %edi,%eax
    17d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17d8:	39 ce                	cmp    %ecx,%esi
    17da:	74 54                	je     1830 <malloc+0x100>
        p->s.size -= nunits;
    17dc:	29 f1                	sub    %esi,%ecx
    17de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    17e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    17e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    17e7:	a3 dc 1b 00 00       	mov    %eax,0x1bdc
}
    17ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17ef:	8d 42 08             	lea    0x8(%edx),%eax
}
    17f2:	5b                   	pop    %ebx
    17f3:	5e                   	pop    %esi
    17f4:	5f                   	pop    %edi
    17f5:	5d                   	pop    %ebp
    17f6:	c3                   	ret    
    17f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1800:	c7 05 dc 1b 00 00 e0 	movl   $0x1be0,0x1bdc
    1807:	1b 00 00 
    base.s.size = 0;
    180a:	bf e0 1b 00 00       	mov    $0x1be0,%edi
    base.s.ptr = freep = prevp = &base;
    180f:	c7 05 e0 1b 00 00 e0 	movl   $0x1be0,0x1be0
    1816:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1819:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    181b:	c7 05 e4 1b 00 00 00 	movl   $0x0,0x1be4
    1822:	00 00 00 
    if(p->s.size >= nunits){
    1825:	e9 36 ff ff ff       	jmp    1760 <malloc+0x30>
    182a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1830:	8b 0a                	mov    (%edx),%ecx
    1832:	89 08                	mov    %ecx,(%eax)
    1834:	eb b1                	jmp    17e7 <malloc+0xb7>
    1836:	66 90                	xchg   %ax,%ax
    1838:	66 90                	xchg   %ax,%ax
    183a:	66 90                	xchg   %ax,%ax
    183c:	66 90                	xchg   %ax,%ax
    183e:	66 90                	xchg   %ax,%ax

00001840 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1840:	f3 0f 1e fb          	endbr32 
    1844:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1845:	b9 01 00 00 00       	mov    $0x1,%ecx
    184a:	89 e5                	mov    %esp,%ebp
    184c:	8b 55 08             	mov    0x8(%ebp),%edx
    184f:	90                   	nop
    1850:	89 c8                	mov    %ecx,%eax
    1852:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1855:	85 c0                	test   %eax,%eax
    1857:	75 f7                	jne    1850 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1859:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    185e:	5d                   	pop    %ebp
    185f:	c3                   	ret    

00001860 <urelease>:

void urelease (struct uspinlock *lk) {
    1860:	f3 0f 1e fb          	endbr32 
    1864:	55                   	push   %ebp
    1865:	89 e5                	mov    %esp,%ebp
    1867:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    186a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    186f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1875:	5d                   	pop    %ebp
    1876:	c3                   	ret    
