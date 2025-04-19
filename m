Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752011172A
	for <brcm80211@lists.linux.dev>; Sat, 19 Apr 2025 06:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745042804; cv=none; b=g+fdOHkCXratDtqMk9v7KCo4FKb5cVJ/CP/FJBTDoIRud002eAdi8zNH4kfFWMNxLgH/rjFLhW0x+65bTVdgF2Q+osgYCa3vPVAC8w2rR3eS3jag1cnMVu++FgaucL9JTlsxu1O9mW8AlVhFQdugSlh5GKUzlmlYMwuUSovRYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745042804; c=relaxed/simple;
	bh=Tyh0dToRA4LXQ+7rErKSQD4NTqAXsx7LjjWIXmKSpcQ=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EaTaaHR4e+k84FZBQFKndGvmM5yhL6dCUI675iPPdgIcXzNOPnXYidR2MNZr8FqKtPdVaJEU1IZObTl8T1/ngDUpvUbExC6J5IEmW3NCsMNkP/RqdHY5n55tlNTMmGy9rvFBT3JnS7jB81VQEQU877TW53cScUmZNCjW0lWUgyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WRyyPbGT; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WRyyPbGT"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c1425fbfcso538494a34.3
        for <brcm80211@lists.linux.dev>; Fri, 18 Apr 2025 23:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745042801; x=1745647601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMui0WVzyvwckCcYsYVmQtsamfg6AQcG6hkaFt/QLv8=;
        b=WRyyPbGTVTa7nTd5T2YAknQ+TJyXUvHyvXSNsnICroM2ViIW/995/lpk/JKyFEPjDW
         1gBIzK+QCQxYFgUvqtY5H7NYn+FMXzl9zN3UrTit+cnV30BErpD84tK9LaCAnK+OvyJi
         gBYjKBqeFVXgWPhSib59PoKeiUOcvYb+lgHmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745042801; x=1745647601;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMui0WVzyvwckCcYsYVmQtsamfg6AQcG6hkaFt/QLv8=;
        b=Pl1RnXELUST1jjOafEzh/TatTsz9DHalyOJCbdX8WRY6nLoDCUJz4wA+j2+Du41wcy
         cqis2EGL3f4URS5P5Y6de9eyRO8Z2/6q/dfcrQYgnDO4Vr1JDUK9TDL1rIkkV/ijF46Q
         KWHM8L/O9bMcKyObo5YnW/WvOFRrTmjzve9zFkuO3xEIkKe3TAURQf6fpT7zAvNUnMt2
         /SFNz0bi3PMUGlc7Skr6u6XXdGcjhqOgQ/j9vVfFOkKACQFzeb13UsrIg1SZDiJsIwgR
         X4NRBpK6ej/3HGsmk9nI3piF12k3jG/ktTMF/Uh5CHtXCvTKSLz+WC4Pj3e6NH4WG1B3
         gaAA==
X-Forwarded-Encrypted: i=1; AJvYcCWtmJfLnRy5dC5xrywR5aiaWhCntdWZk1vlYfx41yX1EPRaXCj6rO2lBkdHKh+lvGyifrepFgLu6a0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW3ET1npFTNesibUG0NMvF3G/8k2LVDiz3vsnWhSvRvWg4ZUSa
	aDTAoC9fnjPje0IKNdfFKq7+Z/mXPiS5eRfrbnX6ts924x0eDEfX9qstLz//BA==
X-Gm-Gg: ASbGnctW4JktD54mv5UdA3FPk4Yzr15ljP1ROPR/tsKktuWtSfe9WQhXVn/aBZEs1Ft
	oc7l2mIsRZzugQFC2/rSreFiTH1Ei55S4RzL2+M1aORcKJvqpYxnlVRFdmuXZl32mJcUpiBb/Ha
	00OQxIW73CAnJdUsXq8hl/7rE+dtIrYSDjk03WYvEoRGe4bXmnK5ELMhB7StFdWQ7GNGJjiw2bF
	va+ctDkhDJI298wJ7bZxVMa7NEBGqX5OgN/AKu0cbc23QmAvbT3VZ75qFBR/s7SmHoNfWxudsEF
	5dnG247OYv6lryRs1oi5DpuS1o9BNW69FRbyDTzku0I48D24Vc4IyAgLpwbofqPd5MatJk6Y5Sm
	SBPo=
X-Google-Smtp-Source: AGHT+IFlLEKvpLqnuHbDUzvn/PT9WKfv6eVYKzAsmWNCfAbMgloyVQnne0ZQOsSTM0cm9LoRSa6c2w==
X-Received: by 2002:a05:6830:7001:b0:72b:8000:d487 with SMTP id 46e09a7af769-730061f3b94mr2921182a34.3.1745042801368;
        Fri, 18 Apr 2025 23:06:41 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300478c51asm616461a34.8.2025.04.18.23.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 23:06:39 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <wlan-kernel-dev-list@infineon.com>
Date: Sat, 19 Apr 2025 08:06:36 +0200
Message-ID: <1964ca7ede0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250416060128.15703-1-gokulkumar.sivakumar@infineon.com>
References: <20250416060128.15703-1-gokulkumar.sivakumar@infineon.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] brcmfmac: fix compilation error seen while building only brcmfmac sub-directory
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On April 16, 2025 8:01:58 AM Gokul Sivakumar 
<gokulkumar.sivakumar@infineon.com> wrote:

> The function prototypes of brcmf_debug_create_memdump(), 
> brcmf_debugfs_get_devdir()
> and brcmf_debugfs_add_entry() are protected by the "DEBUG" config MACRO in 
> debug.h,
> while the corresponding function definitions remains unprotected in 
> debug.c, so add
> the missing MACRO definition check.
>
> Compilation error seen while building brcmfmac sub-directory with 
> CONFIG_BRCMDBG=y
> is captured below.
>
> $ make M=drivers/net/wireless/broadcom/brcm80211/brcmfmac
>
> make[1]: Entering directory 
> '/root/wireless-next/drivers/net/wireless/broadcom/brcm80211/brcmfmac'
> CC [M]  debug.o
> debug.c:17:5: error: redefinition of ‘brcmf_debug_create_memdump’
> 17 | int brcmf_debug_create_memdump(struct brcmf_bus *bus, const void *data,
> |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from bus.h:12,
>        from debug.c:13:
> debug.h:136:5: note: previous definition of ‘brcmf_debug_create_memdump’ 
> with type
> ‘int(struct brcmf_bus *, const void *, size_t)’ {aka ‘int(struct brcmf_bus 
> *, const void *, long unsigned int)’}
> 136 | int brcmf_debug_create_memdump(struct brcmf_bus *bus, const void *data,
> |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> debug.c:45:16: error: redefinition of ‘brcmf_debugfs_get_devdir’
> 45 | struct dentry *brcmf_debugfs_get_devdir(struct brcmf_pub *drvr)
> |                ^~~~~~~~~~~~~~~~~~~~~~~~
> debug.h:127:30: note: previous definition of ‘brcmf_debugfs_get_devdir’ 
> with type
> ‘struct dentry *(struct brcmf_pub *)’
> 127 | static inline struct dentry *brcmf_debugfs_get_devdir(struct 
> brcmf_pub *drvr)
> |                              ^~~~~~~~~~~~~~~~~~~~~~~~
> debug.c:50:6: error: redefinition of ‘brcmf_debugfs_add_entry’
> 50 | void brcmf_debugfs_add_entry(struct brcmf_pub *drvr, const char *fn,
> |      ^~~~~~~~~~~~~~~~~~~~~~~
> debug.h:132:6: note: previous definition of ‘brcmf_debugfs_add_entry’ with type
> ‘void(struct brcmf_pub *, const char *, int (*)(struct seq_file *, void *))’
> 132 | void brcmf_debugfs_add_entry(struct brcmf_pub *drvr, const char *fn,
> |      ^~~~~~~~~~~~~~~~~~~~~~~
> make[3]: *** [/root/wireless-next/scripts/Makefile.build:203: debug.o] Error 1
> make[2]: *** [/root/wireless/wireless-next/Makefile:2006: .] Error 2
> make[1]: *** [/root/wireless/wireless-next/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory 
> '/root/wireless-next/drivers/net/wireless/broadcom/brcm80211/brcmfmac'
> make: *** [Makefile:248: __sub-make] Error 2

To be honest I am not sure whether to accept this patch or not. The way the 
makefiles are setup was never intended to support this usage. The cause of 
the failure lies within the fact that the makefile in 
drivers/net/wireless/broadcom/brcm80211 passes -DDEBUG to the subdirs. Also 
I recall using the M=<dir> option result in out-of-tree taint. That said 
the following does work:

$ make M=drivers/net/wireless/broadcom/brcm80211 modules

So I tend to discard this patch.

Regards,
Arend

> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.c
> index eecf8a38d94a..3cb50140eb2f 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.c
> @@ -14,6 +14,7 @@
> #include "fweh.h"
> #include "debug.h"
>
> +#ifdef DEBUG
> int brcmf_debug_create_memdump(struct brcmf_bus *bus, const void *data,
> size_t len)
> {
> @@ -54,3 +55,4 @@ void brcmf_debugfs_add_entry(struct brcmf_pub *drvr, 
> const char *fn,
> debugfs_create_devm_seqfile(drvr->bus_if->dev, fn,
> drvr->wiphy->debugfsdir, read_fn);
> }
> +#endif
> --
> 2.47.0



