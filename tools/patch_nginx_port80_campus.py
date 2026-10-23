"""Insert campus-safety locations into the listen-80 server block (before its closing brace)."""
import pathlib

SNIPPET = r'''
        location /campus-safety/ {
            root /srv/campus-safety/nginx-root;
            try_files $uri $uri/ /campus-safety/index.html;
        }

        location /campus-api/ {
            proxy_pass http://127.0.0.1:8088/;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_connect_timeout 60s;
            proxy_read_timeout 120s;
            client_max_body_size 100m;
        }

        location ~ ^/campus-ws {
            rewrite ^/campus-ws(.*)$ /ws$1 break;
            proxy_pass http://127.0.0.1:8088;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_read_timeout 600s;
        }
'''

def main():
    p = pathlib.Path('/usr/local/nginx/conf/nginx.conf')
    t = p.read_text(encoding='utf-8', errors='replace')
    if 'location /campus-safety/' in t:
        print('already has campus-safety locations')
        return
    marker = '            proxy_read_timeout 600s;\n        }\n    }\n\n    server {'
    if marker not in t:
        raise SystemExit('marker not found — nginx.conf layout changed')
    t = t.replace(marker, '            proxy_read_timeout 600s;\n        }\n' + SNIPPET + '\n    }\n\n    server {', 1)
    p.write_text(t, encoding='utf-8')
    print('patched listen-80 server block')

if __name__ == '__main__':
    main()
