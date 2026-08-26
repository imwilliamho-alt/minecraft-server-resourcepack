# SWW Resource Pack Server Host

This bundle hosts the Java resource pack from the same Docker host as Minecraft.

Resource pack:
- SWW-Java-v0.8.1-ModelFix.zip

SHA1:
- 7576ca50943d2fccc1cecfab5530587b9448bfd8

## 1. Upload/copy this folder to the same machine that runs Docker

Example:
~/minecraft/sww-resourcepack/

## 2. Start it

```bash
chmod +x install.sh
./install.sh
```

It runs nginx on local TCP port 8088.

## 3. Test locally on the server

```bash
curl -I http://127.0.0.1:8088/SWW-Java-v0.8.1-ModelFix.zip
```

Expected:
HTTP 200

## 4. Make port 8088 publicly reachable

Because Minecraft clients must fetch the ZIP over HTTP/HTTPS, a private
127.0.0.1 or LAN address will not work for external players.

If you already use Playit:
- create a TCP tunnel
- local address: 127.0.0.1
- local port: 8088
- note the public host + public port

Example public address:
http://example.playit.gg:12345/SWW-Java-v0.8.1-ModelFix.zip

## 5. Configure Paper / Minecraft

Edit `/data/server.properties` and set:

```properties
resource-pack=http://PUBLIC_HOST:PUBLIC_PORT/SWW-Java-v0.8.1-ModelFix.zip
resource-pack-sha1=7576ca50943d2fccc1cecfab5530587b9448bfd8
require-resource-pack=true
resource-pack-prompt={"text":"This server uses the SWW weapon model pack.","color":"aqua"}
```

Then restart Minecraft.

## Result

Players do NOT need to manually download or install the resource pack.

When they join:
1. Minecraft sees the server resource-pack URL.
2. The client downloads it automatically.
3. The pack is applied for that server session.
4. `require-resource-pack=true` prevents joining without accepting the pack.

The client still technically downloads the assets, because the client must
possess the model/texture data in order to render the weapons.
