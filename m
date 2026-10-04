Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C203B71BB
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116915; cv=none; b=CoWCKOMimab7oAm0wGHenouNN+xFYULO9MH/uVVhUeTO08dhAUrvUsejVDanv/7zuBKFQ/xp0CajWniOJfjJCOrUdwfv3rcrygwmXcIOOGDmlwRKlBxbBYAsqNN1qtX5Vo3TU10UdZq8oJLNity1oR8s5wdgUCkoHW63ohtEQhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116915; c=relaxed/simple;
	bh=f2x68Pd7As1GqZKJQOjAKYNZhM/BwR7nOPBdxDi+i8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXJUiDxtXC1WGWm6IfFA0EaOKNluLK4azgfcRM0PUtaqWJEQqdVlhB6H+DaIwRfh++ukbKtOG6Qou34W30/qP5fCrk2Z7VzQ76rjh5u0DHkLHMzYXLOlbcYLZbQNPhpbwsAWhJampJdc3SPZ00mxTs/COO+vbaBvxfl97f1itoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MtUpZYdJ; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MtUpZYdJ"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93e538a9703so51448985a.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116913; x=1791721713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vxCHe50qu0ZSP0ZUfgyqzcneNtbGphUCpsLuMQGyLs=;
        b=vZSP0zcZUDi18uYpRjDQFKKmu3h3OKHtm6430/cJTwtu6/Qd+H1IA2p6ae5S5X76xb
         Rj0SEZP/qplncIfbOKzhWf32BAkpvA6Yb26r9Q4lI99zWk2wCic6uZqxkOhpnfBLhw8J
         ccch/DXmQ+rHnG2Eku1qqXoBZu30hZquXYf5xdSRjp8gnAQO2+EggnB+r71DllbDxlTZ
         gm6LCBvLirdguR0KweMb9wh+gcRqUQeg0IRzfCvkXqhNOWFHow5FMvZHoOgjsggf5raJ
         E6LSGaYoV9UvzLpTsY4eW+lobfurVS6xTa08mdtbTy3bFQGwz8+0ftu+mdcYurrSvqJU
         p2UA==
X-Forwarded-Encrypted: i=1; AKwUvBz3qKnZ8atsk+/7Jpg3TB5kumQESU/qImjBSGHdY8wttHUYsgKM+CZRrSOOnkehn8NfrY2/E4YZ8aE=@lists.linux.dev
X-Gm-Message-State: AFuF++kFFmNuy2LB6bLFoR2osquOz/N/GuUlvdf8u+TSpEJuPt5hylRP
	dQR4XQMFgMc22JzULjdKu4z7/L4nCeo+K/3C43ba0jHBqqmvU7pDHvkKX5AkG5+RV1niDvNUvuj
	AR0YrGOn9uRMIt61wYoQ1ZjDILYsEHiQ3A5BBQ/CF3uM9n5h1qRXTpjwzTVDQUDu4OnDu22pjHC
	85X5y7XdBvLX9Py0b+78RhrwEgGJAv3eCa+5yHsedU6U4wxd727JKbYqlayEYc1BEfDkXvF07OL
	2RjEBtKZGHSTGni0Rz2dA==
X-Gm-Gg: AYBFou1lmakgkTli98Lf0Nd/+o/U+yqhwl0o89xV14MM8oUv2P7uMC/UYYBiGXtX/bZ
	tzgJKgHICvUd+1WwawMt7xjPOyIupYBlqzQeWFhzAISKjhWFjP2eBF/NCv/eMU5P/GvaOS3kggL
	BtPuGkUY8LQMS6Wnj34gYa5HodXoXoReey9RLbi6Bvwhihs6jUmMku9ziwt4gPtLMRVNBNYvWIe
	2Z+rm+0HAD8hpUiHYQTxthVEbGqA17LCdYz19/EGowtUAT/cWJN0CVOLgx2eJSGeGEdM8sKJeil
	hlFyUdh/1X4qHaX6KRm6FoRqW4Ol4K3u+2T+DW4z3ta4f9wNmYCc36jmGVZtPyjJA2LnW7Kv3P1
	yR2urQPdtoF4841HBZsM2LDYxWmYGD419y6T82EbOG5tY5W5hh26elP0A5hhLD9XmYh2Caf7flC
	6Ifd+d+agOoNXFrSb4RDG8SaSR1MohuXNJAbqI/wKAqQ==
X-Received: by 2002:a05:620a:6885:b0:93e:5cad:643f with SMTP id af79cd13be357-93e5cad6d2cmr512675685a.29.1791116913274;
        Sun, 04 Oct 2026 05:28:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93cca30e892sm303572685a.9.2026.10.04.05.28.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:28:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso1270998eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791116911; x=1791721711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vxCHe50qu0ZSP0ZUfgyqzcneNtbGphUCpsLuMQGyLs=;
        b=MtUpZYdJOnrp5x/5QRIj7d77iUkEf8AAbYWazPx2qKdNfOaEEbSPAnqSer4iEcqTuA
         DhjsABmnxRUvXs1Ut9yXs/a/NDqIE4jjPIGr5aMjz5V6ue1xfqlBZn2FzQMmCDoZ5G/+
         p0dGQ4tRYJx1XaxajKeGHS6qvEWxIBqAuU504=
X-Forwarded-Encrypted: i=1; AKwUvBwxqTslXB7O/FiXSJIIA9tedQ9w7Pn+xBnBOVxlTLqFNtliBi1tAVBsXYYAR4YR5viDIbnYvDpFX7I=@lists.linux.dev
X-Received: by 2002:a05:7300:d08a:b0:339:851c:4c1 with SMTP id 5a478bee46e88-34db6bfe0e0mr12512305eec.18.1791116910779;
        Sun, 04 Oct 2026 05:28:30 -0700 (PDT)
X-Received: by 2002:a05:7300:d08a:b0:339:851c:4c1 with SMTP id 5a478bee46e88-34db6bfe0e0mr12512267eec.18.1791116910074;
        Sun, 04 Oct 2026 05:28:30 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm7734182eec.15.2026.10.04.05.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:28:29 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Aditya Garg <gargaditya08@live.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: brcmfmac: handle missing D3 ACK on BCM4377 T2 Macs
Date: Sun,  4 Oct 2026 05:28:24 -0700
Message-ID: <20261004122824.1390579-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001085308.1688049-1-dev@deq.rocks>
References: <20261001085308.1688049-1-dev@deq.rocks>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 1 Oct 2026 10:53:08 +0200, Andre Eikmeyer wrote:
> BCM4377 on the affected T2 Macs does not acknowledge HOST_D3_INFORM.
> The current PCIe suspend callback treats this as fatal and aborts system
> suspend.
> 
> When this happens on BCM4377, mask the mailbox interrupt, preserve the
> bus-down state, and let generic PCI/ACPI suspend proceed. On resume the
> existing recovery path tears down and probes the device again instead of
> relying on a D0 mailbox transaction.
> 
> Tested-on: MacBookAir9,1, MacBookPro15,4, MacBookPro16,3
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for the patch. However, an earlier patch from Sebastian Reichel
already addresses this issue generically: "[wireless-next,v2] wifi: brcmfmac:
Improve D3 substate entering timeout handling" [1].

That patch makes the D3 ACK timeout non-fatal whenever Wake-on-WLAN is not
enabled, which covers BCM4377 as well and avoids the need for chip-specific
workarounds. I have accepted Sebastian's patch, so this one is superseded.

[1] https://lore.kernel.org/linux-wireless/20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com/

Regards,
Arend
