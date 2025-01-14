
# RStata 统计程序软件归档

> 由于 Gitee 现在需要实名认证才能开启 Pages 服务，所以 tssc 不再支持从
> Gitee 上安装了，目前仅支持从 GitHub 上安装。

这里存放在 ssc 上所有的 Stata 命令以及我从 GitHub 上搜集的各种 Stata
命令，另外也托管用户自编的 Stata
命令（带中文帮助文档的也可以），欢迎大家关注微信公众号“RStata” 和 “Stata
中文社区” 获取最新资讯和动态！

|                                             RStata                                              |                                          Stata中文社区                                          |
|:-----------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:|
| <img src="https://mdniceczx.oss-cn-beijing.aliyuncs.com/image_20201120143454.png" width="50%"/> | <img src="https://mdniceczx.oss-cn-beijing.aliyuncs.com/image_20201120143508.png" width="50%"/> |

## 安装 tssc 命令

``` stata
* 从 GitHub 上安装：
net install tssc.pkg, from("https://r-stata.github.io/tssc/") replace force
```

## 安装 tssc 部署的 Stata 外部命令

``` stata
* 查看命令列表
tssc list

* 安装命令（以 spmap 为例）
tssc install spmap, all replace
```

另外你也可以使用 net install 安装：

``` stata
net install spmap.pkg, from("https://r-stata.github.io/tssc/ssc/spmap/") all replace force
```

### TSSC 命令列表

tssc 上合计有 3104 个 Stata 外部命令：

> 点击查看完整的命令列表：[cmdlist.html](https://r-stata.github.io/tssc/cmdlist.html)

------------------------------------------------------------------------

<h4 align="center">
License
</h4>
<h6 align="center">
MIT © 微信公众号 RStata
</h6>
