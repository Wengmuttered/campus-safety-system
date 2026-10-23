import pathlib
p = pathlib.Path('/usr/local/nginx/conf/nginx.conf')
t = p.read_text(encoding='utf-8', errors='replace')
if 'campus-safety.conf' not in t:
    t2 = t.rstrip()
    idx = t2.rfind('}')
    t = t2[:idx] + '\n    include /usr/local/nginx/conf/campus-safety.conf;\n' + t2[idx:] + '\n'
    p.write_text(t, encoding='utf-8')
    print('patched nginx.conf')
else:
    print('already patched')
