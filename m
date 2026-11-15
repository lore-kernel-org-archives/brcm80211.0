Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776593;
	b=nVRxx6poRiUkKqgV2NEyd+52AoytepX24c32NkJhXZZvk/I1nI4hZxYoBXmKjvjzIcP8
	 QhR4PcMbaj9YKvlkH5bEmi+cg/C9sNDWeTeqv+izViGSzyrI5ozpHTEeZuRsoE3xsVucW
	 UJx/D08I2jaq416kPcDNPBfFrPyX6z4MEeAma4iBW+ydDOOrkb7P3/Wx9vOXFxQHasdmS
	 C0AH+AMkYSyFxvo88oWIld8249bUeD1+31fCLhih/RcrXCmjMhxGDJ7c6fiD3sM1EUl9k
	 tHW528UYUyDhlkgATP22lePdc2hfwLxunMNNBOvaZPU6z71keoZJ6EijiNF2IG4TMnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776593;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
	b=EeDwtpKmtaulhWU1reWCwMhMoNtVNbh3cCYyCnYR44FVw6sjz5ORKRc3D4KjeWOOFdZc
	 TGsMhRpiJWYf2GXFvG0GajZNMFS/4vsMt2lHBmGh7CGJ+wdKuYTYvEDBYtArsNE4XSC4E
	 KchKl/n3eB0GjHd3r+JKIVw8ndISNdsoEaoMI2rkv71M+/I6g+qvN5agU89cYOXEsCb3n
	 IX4KP6GwLDkyg9lmEWYwZU8n1JlTUL3sGObgDdbdTExnjXg41UW2+I39izsVabwVwTHZF
	 hk+uvOm5OyaIJigHJkI+eqvjeHC3nJw6sTKyb5ujjxbPaDXfysku0c4w05k+2sQqP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RDnguVHP;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6FF606A329
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RDnguVHP
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3395719eec.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776592; x=1795381392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=A7EwcI95KZb2HHsKqGJgJkt9nEJkt5tpBmolnAS1lr6D4lZRuDnfJ/uT9RGm5lJEkH
         Kd89/lc3bcinW+D6Sh25/eo0oJOLY+cu6zeeHogVdKXgQRaxvc7yKM8gk8JKQsJf1sTU
         11Vrb3Gip1wiZBTBbOc+Ay9DuHztSdhCbm5FGxjLsJbvmqqCSBEMDOx8rA7iklFUZNog
         jR/XsmzGVbhRiYehxs+kcZ40BJfk0B4zwVrNLHUwUd3wJnSuRWGk9bdPqn0xs86E3fVz
         selHIGaoxw11MkIELzV7bFtXmhM+8wYuHkH/U8ggtQkLH2E0b9M/BzugyUXQ5nnT4k/s
         odcg==
X-Forwarded-Encrypted: i=1; AL+hErHGlFf+VTYbtmWa0YDCxaa3ofGO+JdYyrYi7yHEH0//VVzHO8/JYCOIbmRmsdY/p/ZfFVg2rWMHdPE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wmmK12H8pJapKvg3mzZy5B7G01+NMRjixs1FIm2MckRdraqIt
	OjI3U4zisGPrCgwVjG8WGb477bLv81PdIqQUYTVCIHeym5k8J05akq9JDvBi9xT8mtoO+yW0i3f
	J6eVR0VjCbOC039NeAEbC3eZ9+QsxbFCtF12X1MG0EqAthRCUfpevN8LkcaLXtbZcSQiJQzjNcD
	gab+2lBGEB1QpUQP0/m/K3J2EfDnnAWTSCUHOyLFhXsjD7e5jx7qn9cKl5g3QqzbLfvPK3lfItL
	ZlLSBn8Y4+8NhJLRHw0lA==
X-Gm-Gg: AYBFou3/+pO5S7ZTHP3DyGP3C6KvAvZW5B+AVddaBwdwDYnkpDM0KMZavspmc2/7c4F
	rx9Tsp+EpSRbzcT7H9TOp+GeXqIdgYwNMMDHwaj182e5vK+CRm7UwnEc4KfRhPywwzqFlWIAThR
	+kvMlbTPSjz9L0sS9DVTxf8oh5yXdXzapLMZ2VxLf9VzcVfnN+CPs0AsSkme1S6zTt0MPTg5Fli
	HFWPfi3Y0jNGuWN0AHc5g+DpVuGE4zrWM2Kf3JHoycoPPa0aB0BGb49o7yM09x2YUaIDEY5nRd1
	DcvRAsAHNU9+bcC/kO1uLLHs32CpnWswGW2KruT97wnSEt7oNJ5vloI6/OBA/PA/oOL7E9xu6uq
	nuQAXfUdU1qwDcCv5xuXS0y0xLdztaJ5wASbDDvw4uxD2BUYYK20MNh0oje+ivGRUMNc4R7Syp1
	uEOQ1Id1HpNIIbm4Eqg3qlupiU9mP9/YGnftG2OLM=
X-Received: by 2002:a05:7301:92b:b0:37c:6001:8757 with SMTP id 5a478bee46e88-37c60018931mr3084158eec.4.1794776591274;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3795a09a8e6sm265467eec.18.2026.11.15.13.03.10
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so1055147eec.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776589; x=1795381389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=RDnguVHPi/X9w8emX5Ldq9dmj6Gp4pbDw7WHyIKvAQHehzo4N9To+qPpSLgbk2FBSJ
         vZu5Z3dQkn/oqZYzcxCMKZKhg78FKDvNXojNi62ocpyUQF/HkmZj6UvB8ElC+mfTDUKe
         HfthA0keRrEYnhZtRxozuQpuxU2xMkpXkK39I=
X-Forwarded-Encrypted: i=1; AL+hErGkid4oUX2yO2L6Lq3N1XcmIrhatfRikwiopi/0LwPEG36q+mlXB9noXbm0EiHlJAkoQqX5Di15ajg=@lists.linux.dev
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857530eec.40.1794776588822;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857506eec.40.1794776588102;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: use a 200 ms power save timeout by default
Date: Sun, 15 Nov 2026 22:02:52 +0100
Message-ID: <20261115210253.883721-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151626.70737-1-dev@deq.rocks>
References: <20261104151626.70737-1-dev@deq.rocks>
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

On Wed,  4 Nov 2026 16:16:26 +0100, Andre Eikmeyer wrote:
> cfg80211 calls set_power_mgmt with timeout -1 when userspace leaves the
> dynamic power save timeout to the driver, as NetworkManager does. brcmfmac clamps that to BRCMF_PS_MAX_TIMEOUT_MS, so the firmware
> stays awake for 2 s after every frame in PM_FAST mode and rarely sleeps
> with the background traffic of a typical network.
>
> Use 200 ms for -1. macOS 15.4.1 sets pm2_sleep_ret to 200 ms on the
> BCM4377 of a MacBookAir9,1, seen in a trace of its iovar calls across a
> sleep and wake cycle. Measured on a MacBookPro15,1, idle with WLAN
> associated:
>
>   pm2_sleep_ret 2000 ms: 11.2 W system power
>   pm2_sleep_ret  200 ms:  9.2 W
>   WLAN off:               8.8 W
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
