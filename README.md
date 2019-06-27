## npc 运行说明
```bash
docker run -d --name npc --restart=always --net=host -e SERVERIP=nps.server -e VKEY=abcd
```

## npc 相关配置
```bash
SERVERIP: nps服务器域名
VKEY: 生成的KEY密钥
CTYPE: 默认为kcp
```
