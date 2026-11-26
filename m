Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703384;
	b=fLdKs9WXdTa3F7oW3aVfSBlZp8ISDVZ3oTGE1f9mn5k+pFVHyQN0x6K/6pZmgicTIzG1
	 8zp2YpQ4IuJPtz87VAokBJXyBt6Q4GmdYYLbjCyKOcf6d2NP9/l8hC8Q8IHijlnzhT56k
	 lAZlft3c4q4XMsW/C/bjafgulHkRTekKz+1o87lyZrpMJKBu2Ak2AjABPKtGpXyjIWFYP
	 HTsPxYHho2+4FTT2CCxyzVrh2Up1hTuMSgd024kXcJG/UqjhENf9b381PC5xfzqz1oWnW
	 7myt1SswMX3CZnBExdXrYjq6ZiJW4KEMp2CULW0xx8CFFhCDzYnJirtSakFImGDsbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703384;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
	b=dOkrtvC5gQ5UvfSjme1bxchhMUuEHz4Dv6QgQ4amQx9AmYDKJy7FqXv2g/ZG/irhA+eL
	 jMB7PZvsdRanHV9O01jrRfwT5jeC/JJxSVET9m71BkQff9pDRsbqJCnHcDv0/X+YBP6aw
	 62ws7AoQcQXcZA8JWVw7PloFboppB+ImpMvYiCGmnZezRy968sum5E7VApWnbKbbsjvJA
	 fi18ZDxaIhV1v/Xpz2ytGePFZ9sYmY6UfHLECiLiOYqvxOY8n+m1I0sxKG+pglPw3n8+B
	 qOuPV7Ny3XuC/dBUAheIoFtTkAqzHggVV0ZrH5+wQ/Aq0SU3IBeOkhKAbVocBZGrlPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EKwVgqz9;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E3606A332
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367E3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EKwVgqz9
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b439e37813so3673724a91.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703383; x=1796308183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
        b=LB3vhv7g6fxS6H2bbFtV9pclsc2jK4Oh6vqO8MOKubKCM6LWg0oB1ZyV3TeNSOick0
         W7YV3dNFJJz61SnKYY+jyKLu1oI9rd2iGYYfXfFMH5yyviLXwPVPkc6gIuHeShZC7/Xb
         teKVYotivEZpeBJWc4HIzZOlOQ5kClbgJKULGi/2Cop6yS1l8EFLLF3acLi9ECWnUmqD
         urQrgP4saaDdqCzcv7f9kPT474XNeBSDhKiB96YRwoank7h8rJKRt3IOY4rKEGe4rT7A
         8uBWGcH7PoYFql08spulf/Vx3L7UlK0KVvCAxDwhvaC2Drz6IAkIBKWvOVo45X4SC/Ec
         UYzg==
X-Forwarded-Encrypted: i=1; AL+hErGQ3KAYX2G4l8IIcDDznYVZ9yBeQEAkfQXIgaZ/37223T3V/dnyJhDNZAKt0/2IsgjT30mn/Mq1bHQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9xINSsEcKDQdRzxDjyLu942hFNXISw2Vblr5Wo0vwN8CqBevKa
	hdy89jx0YShfcHpPASH/lxqvwmkgDtfVN+eCRzj+68og7Bajc2NxWru8I8oCNvU4KnHcWdokHuK
	7nm5wECUJCIKBUP1DfsUPnHG6YXI+RzYhK/5hgFhAw+wEUZ9cIzmrYrrbjvcrBi/K1jETCxkucj
	3ZxH8DN6kmLvzND7xG6STvYPFphae+x0lMPQXZEP5PYVKYqbn6OjXX1nFSWzn88VSQGj/h8wVGr
	HRGz3ZCw4o4JrZPpGmSIw==
X-Gm-Gg: AZFdTZegxBJSTzQwKf853DwAQY8Wsb68B1zmZnLYzQEl2aRXYA3rphngrpwSQFUiIve
	igIj+JFF/++H3pcX0U7vfv5iAZBJO7pwzeC8in5qwOC4pvafB99ZtAJM7iupT2mb4CowfghvKjG
	DwQjltYx3hnT5mL9G0aDuet6vqG5V9qii0FDFBNhALKoaPn6H53mAq9G2IKHE9GgLX5MzMOsEBW
	pvFGFgPn+gHGqGijxAZqLU0ufsRxdSaRLbkKrKDVQGnM6MDD4I337N5F+q/n4YV4zvKPS1wsQIw
	MKRjadD2UTFYgYqpdVfOnO1QErE0eg8oZ4NVdgE6MSIXqeVbgdnXE7QPwKLggwASrdhS++2ZjkH
	9XGFi+EIBMjGQF5lSpFagaG1+vI7einPs2v3YwPsRl2WcBWnPEVGBvVlwmxuf2WcyqCwW7yEK+N
	nAmSQkdeklUBnJIbFfAjxiUJHWdEwKKoVrerSBGB9ynw==
X-Received: by 2002:a17:90b:224e:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3b41c7d6084mr18941757a91.8.1795703383207;
        Thu, 26 Nov 2026 06:29:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b405960cd1sm15414261a91.2.2026.11.26.06.29.41
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92179251e32so35791796d6.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703380; x=1796308180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcS0zzYLj6amiNYIMyvpaEQtFvfGgBS7wxP5RJztEeI=;
        b=EKwVgqz9UMdoAl2tzkmzQCVFG//vHZCKwv/+BQm3N6TFI4uGavjw0SB6yqwgXPCnD0
         f3YFWLN6Refquf28euABXMq5awNJUJJwtfuRzL/U6wJJbg4f+4JSXiYb7dsxCGDygtht
         ZbGrfK3FYZieX1i4AW0/+KyYNS6eCqhLL9lss=
X-Forwarded-Encrypted: i=1; AL+hErG4YVM72dgnhWjQ9Ii40qU1qx39JQQevVWZnjqR23Nesm+h0sVsTHyn4zAMZpfPC5ZXLdHwIlcM6FE=@lists.linux.dev
X-Received: by 2002:a05:6214:2487:b0:921:7305:47c with SMTP id 6a1803df08f44-92173050758mr132277776d6.52.1795703380504;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
X-Received: by 2002:a05:6214:2487:b0:921:7305:47c with SMTP id 6a1803df08f44-92173050758mr132277336d6.52.1795703380030;
        Thu, 26 Nov 2026 06:29:40 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:39 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH wireless-next 2/3] wifi: brcmfmac: pcie: bound memdump to the mapped TCM window
Date: Thu, 26 Nov 2026 15:29:32 +0100
Message-ID: <20261126142933.875175-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-3-sorencoremans@gmail.com>
References: <20261105215954.184290-3-sorencoremans@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu,  5 Nov 2026 22:59:53 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> brcmf_chip_get_raminfo() reports "RAM size is incorrect" on a dead
> device but leaves the bogus value in ci->ramsize. A following
> brcmf_fw_crashed() then dumps that many bytes from the TCM mapping,
> which is only as large as BAR2, and faults in ioread32():
>
>   memdump 0x00200000+15728640 exceeds TCM window 0x800000
>
> Remember the BAR2 size and refuse dumps that do not fit. Only builds
> with CONFIG_BRCMDBG create the memdump, so only they are affected.
>
> Found and written with the help of an AI coding assistant (Claude Opus
> 5.5); the cover letter describes how.
>
> Fixes: ff4445a8502c ("brcmfmac: expose device memory to devcoredump subsystem")
> Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

[...]

> @@ -1669,6 +1670,12 @@ static int brcmf_pcie_get_memdump(struct device *dev, void *data, size_t len)
>  	struct brcmf_pciedev_info *devinfo = buspub->devinfo;
>  
>  	brcmf_dbg(PCIE, "dump at 0x%08X: len=%zu\n", devinfo->ci->rambase, len);
> +	if (devinfo->ci->rambase > devinfo->tcm_size ||
> +	    len > devinfo->tcm_size - devinfo->ci->rambase) {
> +		brcmf_err(bus_if, "memdump 0x%08X+%zu exceeds TCM window %pa\n",
> +			  devinfo->ci->rambase, len, &devinfo->tcm_size);
> +		return -EINVAL;
> +	}
>  	brcmf_pcie_copy_dev_tomem(devinfo, devinfo->ci->rambase, data, len);
>  	return 0;
>  }

The bogus size is left in ci->ramsize because brcmf_chip_get_raminfo() does
not clear it when it returns -EINVAL for "RAM size is incorrect". Clearing it
there would fix the source for every get_ramsize() user. The check here is
fine as a safeguard though. You may add my acknowledgement in v2.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
