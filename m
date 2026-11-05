Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900023;
	b=23zGR9MNa7Tkc56XZbGZoZ9s8Hi/sDwBGt0Q9Lm7FIFxIAA7VmRHljXkGOB/D/qbjmXo
	 0qsugAlZoKLL7PRPcHxfjdbJ9B2nhKPF9Yu8uUr6UbTumZfMe7UoNNxnt4oSZOiXEDfOt
	 nEF9sZKLSpkoYxf+zxmyAUrGOZVZxn9WnX7W9SRu6HUazDhTCInDUaI6Gm6wVghsOTtEG
	 Clvo6CqT///8SnGi1Jw6GHtwjybzmMvc6PCPWsDtHdWPSNY/ulhCGNCmgNn319V1vtSVU
	 lu2BdmHxWffRW1KskORv4BBtFr3OhuVOQTAGok8bnF7dvyfYxiWus3mnekhKYMlno1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900023;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:CC:Date:Message-ID:In-Reply-To:
	 References:User-Agent:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
	b=WGOK8YdXXuHuMIHoB6UJqQ/vnDXkIlqDTzJUPa7kn0YynOwjNDzBfxnqyjswbvsJJ2rn
	 xN0zvgcgOqNLDwlLEIGSiJAZp62iU0of6msj5WolE2GcQ6Hn9QdVDuSW8bBPCDX6jEOim
	 zd/s5ct4yvbnmRKIKou9KiyoJiMXxl4rJ5MNH0P5uwaU5wdryPiyDkzsCD/eB9grF+HYx
	 ssqDTXCO8iLSDfFzYUr/7gBR/LzPYr/0uxh8fE6AdgdM1oalvU2H8FQ3/m/MssVRuS/7T
	 qplInGAvXQDa/FyDpJmWQDKb9obka53HOWHDKSUwoCg1j6hvuyhIHXBpZwncRbfkTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AjkoTP3O;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A3606A329
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 17:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7A3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AjkoTP3O
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso941391a91.1
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 09:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900022; x=1794504822;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
        b=Xtbfq5QdUnwrgCkNyDxZ7RQX+8EIrIpllj7Pwt4W8rkSP6CWCHkddfT0kWphNw4XrL
         DCiNidyi5U+mrdRWDK/pwG+3G6XQcJc4LSwA3Q4lH7eqN2P+TkyhyZkiRBQ66JPK62yz
         CbmM4gOYNZ/VW4jo7CTfOGPEvhB/IETETHMN+15MpAcqOVsRTXAwIBQ6tSGocENkog7i
         zx3KQqTr5/zvpGKIcRnEXgpYk7zeGlsM+NnrZmBXoH/ksjcLgQhUwE0XvwjQHg2G67dY
         QBM6IsdRVanwkM6n44YLXeA1p1dU/0GWctKjpKu/KJWU++LsvRp38Fn7Qz/v0e6Barqc
         /iCw==
X-Forwarded-Encrypted: i=1; AKwUvByKmqT8D/tQtpP70XKOTmbGplSFNU4CIxxMl90qwGFDn+3HcHTyiTeALvbo50GtD6TrzY91BVrbPkw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9/93d/jcNPIj6t4VQLhuN/Vl0Nu9nksMKPo0+37ua4kcs353E
	2Uy6DnHtc7f4HN2DfRiOxN6kzCh2T25HXlnGz1QmVQGHSlI1+jeu7YKJ0ugkkJ04zC3vqkdONiK
	7lqH61Wa6TlyjKYxhtovTVwGtgNMZkIbRwYX1SeryHwOzdR+WXX8yNfEiiPtqDnqhyGQ5KVj/0m
	/SObS/i9aIhKJBbZogAdYkIorxG/lJ8YmxNrAqEMlrkABLneBlho7xz4t3xqi5cYWaVUb1prrgj
	sSLmePTBRNHMMXfouvl9A==
X-Gm-Gg: AYBFou138Vzm8SetHK7C7RAHsZ9ce9fjaG8MNH7sT9RQfPnBV0v9icJd+f4sZNshuRJ
	2O5G9s6J8KOOw+gjFmHRRRt8+DP7mRpdNSRDL02JD1biqsQPnEXV1tILqyfG/ob2XPUAG4BGupi
	5G1IOuGx2FGbv3TuKMWy187o1w+ur1NBpXrhITbfTIhOZRHjSDf6Tz0GD4If2rXLA1yjMsC1+UV
	pCCHwTN1P7W/p7VH8xYDvSnxdyTrWh//bnfnaK9KvFWbf2efeNmHVZ0VGvrjX2FGOCGUtPvJx2X
	vZmx/NCCVgJo07SbQir9R+4nDoN71jfjBHxgRnDpYO4d9Z6nVtmtCix9i4Gad/g6LPLgSlpGuRp
	Lr6EzFXEdtCaNzI7KdcyU46QJ70w7FWeaqkE1uu3KdRasD68KKwjWrCKZTAcpAdY0XVZFdoCFBF
	DOfIupHPzpJ+OJ8r0zfuGtMm2UVyGtMIWa9HY/Kmc=
X-Received: by 2002:a17:90b:53c7:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3ae897c5e5dmr17180522a91.59.1793900022139;
        Thu, 05 Nov 2026 09:33:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b094cf3bdesm1586984a91.0.2026.11.05.09.33.41
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:33:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so1866080a91.2
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 09:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793900020; x=1794504820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaFE8iTb8ZQzitBt5EqDvKEkChXKzQMc8ot83f0D0Wo=;
        b=AjkoTP3OX1BxuKrVZeiQ6At5Ws1dm2QGdnnLQfJRNt5oiG2rbwY/hzU3mN5PO1Wjql
         p3tXsXRcFXkoLfVcC6g9OEIcyHypEVQu3tzXVjsVgcEDKoaQItERiGvyVFLi8uvwLnty
         Y2Z6f8lSC1c01QP1X7WtXB/U57OR22OuGY/9A=
X-Forwarded-Encrypted: i=1; AKwUvBys/5ELpbvc6tC8cUuSNsyAfGx7y0AhxhcWy8jWMwZ+2DKALmiVjnx8UAhkL4i/tk8KAbbeOpTLID8=@lists.linux.dev
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr15916794a91.19.1793900019915;
        Thu, 05 Nov 2026 09:33:39 -0800 (PST)
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c703 with SMTP id 98e67ed59e1d1-3ae896f8649mr15916774a91.19.1793900019449;
        Thu, 05 Nov 2026 09:33:39 -0800 (PST)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm4597873a91.14.2026.11.05.09.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:33:38 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, Aditya Garg <aditya.garg@linux.dev>, Yossef Osman <Yossef.Osman@proton.me>
Date: Thu, 05 Nov 2026 18:33:34 +0100
Message-ID: <1a1acc5e9b0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261104151547.70333-2-dev@deq.rocks>
References: <20261104151547.70333-1-dev@deq.rocks>
 <20261104151547.70333-2-dev@deq.rocks>
User-Agent: AquaMail/2.8.1 (build: 200801029)
Subject: Re: [PATCH 1/7] wifi: brcmfmac: match firmware capabilities as whole words
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 4 november 2026 16:15:51 schreef Andre Eikmeyer <dev@deq.rocks>:

> brcmf_feat_firmware_capabilities() looks for each capability with
> strnstr() in the space separated reply of the "cap" iovar, so a
> capability matches inside a longer one. The Apple firmware for the
> BCM4364 lists "hp2p" but not "p2p":
>
>  ... evt_ext lpr_scan bkoff_evt hp2p rng_reseed arpoe
>
> The driver still sets BRCMF_FEAT_P2P and advertises the P2P interface
> types. wpa_supplicant then creates a P2P device, which fails because
> the firmware rejects p2p_disc and p2p_da_override with
> BCME_UNSUPPORTED:

[...]

> Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware 
> command")
> Reported-by: Aditya Garg <aditya.garg@linux.dev>
> Closes: 
> https://lore.kernel.org/all/MA0P287MB021718EE92FC809CB2BB0F82B8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM/
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Nearly identical patch was already accepted in the 4388 support series. 
Dropping this one.

Regards,
Arend

> ---
> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++----
> 1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
> index cc19e5e7ebf..b324eb53a69 100644
> ---


