# dl-deno-sync

> 同步 Deno 的最新版本到 https://dl.deno.js.cn

1. 安装 coscli 工具

   ```shell
   wget https://github.com/tencentyun/coscli/releases/download/v0.10.2-beta/coscli-linux
   chmod 755 coscli-linux
   sudo cp coscli-linux /usr/local/bin/oscli
   ```

   安装完成后需要[配置参数](https://cloud.tencent.com/document/product/436/63144)

1. 安装 sync 脚本

   ```shell
   wget https://cdn.jsdelivr.net/gh/justjavac/dl-deno-sync/sync.sh
   chmod 755 sync.sh
   sudo cp sync.sh /usr/local/bin/dl-deno-sync.sh
   sudo ln -s /usr/local/bin/dl-deno-sync.sh /usr/local/bin/dl-deno-sync
   ```

1. 自动同步

   添加定时任务 crontab。

   ```sh
   crontab -e
   ```

   输入

   ```txt
   */5 * * * * root dl-deno-sync
   ```

## 说明

计划任务语法有 5 个字段，中间用空格分隔，每个字段代表一个时间单位。

```plain
┌───────────── 分钟 (0 - 59)
│ ┌───────────── 小时 (0 - 23)
│ │ ┌───────────── 日 (1 - 31)
│ │ │ ┌───────────── 月 (1 - 12 或 JAN-DEC)
│ │ │ │ ┌───────────── 星期 (0 - 6 或 SUN-SAT)
│ │ │ │ │
│ │ │ │ │
│ │ │ │ │
* * * * *
```

每个时间字段的含义：

| 符号  | 描述   | 举例                                |
| --- | ---- | --------------------------------- |
| `*` | 任意值  | `* * * * *` 每天每小时每分钟              |
| `,` | 值分隔符 | `1,3,4,7 * * * *` 每小时的 1 3 4 7 分钟 |
| `-` | 范围   | `1-6 * * * *` 每小时的 1-6 分钟         |
| `/` | 每    | `*/5 * * * *` 每隔 5 分钟             |

## License

[dl-deno-sync](https://github.com/justjavac/dl-deno-sync) is released under the
MIT License. See the bundled [LICENSE](./LICENSE) file for details.
