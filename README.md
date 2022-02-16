## Hotwaire Turbo Chat

### Description

Simple chat with Hotwire, Turbo and Stimulus.

Implemented in Ruby 3.0.1 using Rails 7.0.1 and PostgreSQL.

### Launching

1. Download or clone repo. 

2. Add postgres credentials
```bash
$ EDITOR='nano' rails credentials:edit
```

```
postgresql:
    username: ***
    password: ***
```

3. Create database and install all dependencies
```bash
$ bin/setup
```

4. Start server
```bash
$ bin/dev
```
