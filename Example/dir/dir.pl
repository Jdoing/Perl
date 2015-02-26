#!/usr/bin/perl -w
use strict;
use File::Spec;

local $\ ="\n";#当前模块的每行输出加入换行符    

my %options;

#目录路径
$options{single_case} = '/home/jiangyu/src/pl/Example';

   my @cases;
    if (-d $options{single_case}) {#判断目录是否存在
        my @files;
        my $dh;
        push(@files, $options{single_case});
        while (@files) {
            if (-d $files[0]) {#若是目录执行以下操作
                opendir $dh, $files[0] or die $!;#打开目录句柄,若失败打印错误信息
                @_ = grep { /^[^\.]/ } readdir $dh;#过滤掉以"."和".."的文件,即UNIX下的隐藏文件
                foreach (@_) {
                    push(@files, File::Spec->catfile ($files[0], $_));#连接目录名和文件名形成一个完整的文件路径:
                }
                closedir $dh;
            }
            #若是文件直接压入数组@cases中
            elsif ($files[0] =~ /\.t$/) {
                push(@cases, $files[0]);
            }
            shift @files;
        }
    }
    else {
        @cases = ($options{single_case});
    }


print $_ foreach @cases;#打印文件列表
