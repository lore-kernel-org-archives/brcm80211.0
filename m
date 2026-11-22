Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378180;
	b=hv1HoTx2YxcuI94cMahi4PbsyVj6ymIWe3qhUTKcRuoSAKQ+S3/CPhta9jaKyL0Frmpr
	 DL13va3YXijQKxvRL1W3YaMMbhELaSGF4Oo4/T9eUZGD7esYTmywwCp7eGmt4CVMdcfas
	 +3O4iLm9qEEyq0ueYas96vIuP7Mx2w/gSWV5zcF9UJgWsVsAkFKLWOIclYK5AtJMldKko
	 P9lcQrmNan8TAuomG9E/TevX+IYOxAMpvBlcaxjEEIxycBEj9ou3bQEKJI2uwCgB1Hhi1
	 x3TTOSfM8537Gj/0os0TcvEyt0PZSI7ifaWB1e9+whNxYovwycbEZ8cJfYSwNWeMPkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
	b=LY64qBQwkGaRw+w6XisWpWYZve1jMwi2EtVfp5tmTjFMAj5HTgjBE/4Gy8JpizlStrB+
	 c6O2zacCFbU0ZKCzv49yCryoFWcvi/tRRs/Tw2WEBKFiehJs3eO5I39aAziuHWCTs4/6B
	 kFrwAESBi3j67bH6SLaxHMqRZBiMl8Y2oeGWnfFVvvFZ1VGm+KqNzkRNoywdLCKRqtw80
	 P7mr3yX9Zk2cX5UtOkDVC1LwqCn17yV9K0eU4UWLhMqh/YVlf+MbzUG+cGIEIf3VjNX/U
	 yjq+5FZcBrEQ/LfCbMkruemNQADVFgEShuYLFQu04TIrK5g1l9+Etu/CrTNFL0WKKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RPiwtY10;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ECE606A31D
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ECE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RPiwtY10
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f02ee04378so20698895ad.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378179; x=1795982979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=oWKSZzYQ6uJwtkzH2lda8FrUF3+EdJAs9gXSVaXId7Sw3Llryb+ZKqI77bvSPmwUah
         bhDtkfbsTUSEk9oqLC6Q7pq3sjXPHUqIq6j4xaw/7xkfb2b+h2bP53vuXxCS9dbPcv7m
         RgIJHaqxLTHCwTx95bzWv9KSPdFsr6123dycr6mrfiqYpRVD7OzKWRkVa0CfQTaIE8al
         11NftFKgeGVciLE9buk7eG/wCQRQAG4XntuZltzKBq5TooKmX4nVb7TSCppd/ZLlzOkh
         2vAwdzS0O8juJj3DCVWHTShtDUFe5LiDAWOwWdiZ727iqrZajtFg4hBnzDTmaBJZkwTv
         oRLg==
X-Forwarded-Encrypted: i=1; AL+hErE0hpoRs6M3f4uZTsczD8LU71KdGPMR4DSW0qJqL15cUzOusjO4acuC0ic+Irdevs+kg0BjTXCJ6ys=@lists.linux.dev
X-Gm-Message-State: APuU4Z/p8ozT29uIAtJ0ZW6rILe8Zjd3l9yBwT/7rX9ER0orHeI31jfk
	w9Jbg9IqXpsXv95k79DbZpFPhyeK0cF4JUIkhar45jDWKWL5Lf6K89jkcJqCGor7n9x+uovjRpW
	6mxG+aDZw3U8DAQVQHWGcBiKEHaPws045K0hmSVarDX5cxn052aDmpB1lNph+EeQAmKO07KK8LO
	NWtT1IxT3M9PqmdNmcZcDldTgetXsfidNg5qmzEcmjijqxemARkkSyfatCLjNwXqc12/bTOD8++
	aR2RLDrcRS7JsMRU7RMjQ==
X-Gm-Gg: AZFdTZcjpZmZ4HiW1+xG2USXKzU158YHHPPH5TmKg5MNqa7C8ZwDBLwEOXXohT5TVm6
	sO+ideKuD0tVUW8qHrYEzLqlbeAuc2sfyWzAsy/JD212Z7fqN8dVkDxgdDrCb/o6S+QO6ogp87I
	dwzz4GhYvPxFRrDAQJVxrsY5HVsvrJCg4RxbKriLlTc7M9g3UO8oSMA/yd7R4Y+KRptImsYTcch
	5dLlM7/obK18er0PNZ9jnn8pBlIzAXITJpeXoR/tSD73hKZshUBEB/x9unION6rpSLwN+VPUzqp
	oUfVUhxIw8RJTJJ7ne3QG6033cUQZhVn8zk7jo6Uv+Ti69/sdo+rLX1RT4MS7Goj2Pk13bKD1vB
	YSCD7SLvBGQmXznfM1n2s6zSlxm7UfBB/+Y1OgFDgnf724tlFKidDw7qXHUWotdyKaBCc3trQjX
	DHNpcgt5tPYQgeTxTBRi5fMARsTYmj/NduxYL41H5RZQ==
X-Received: by 2002:a17:90b:388c:b0:3b4:1c0c:6863 with SMTP id 98e67ed59e1d1-3b41c557600mr8985414a91.0.1795378179334;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23cb9dsm3116894a91.1.2026.11.22.12.09.37
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so295659185a.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378176; x=1795982976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=RPiwtY10h3MEqrZ8Inqvg+0CpDnl5BSBUGCC5OcB5sog71zBcTZc9vtE0Od0Ukwh2j
         WnBBCt66Pf1UkiqvnFpWgDkfCKNFQ6xOrgZ6cKj8keIA/7pSLTs7XE3lqNxJgeqxWP18
         1OUwOmuDBXPCN/jMAtAkLl0LQSS0U8WBg4+TE=
X-Forwarded-Encrypted: i=1; AL+hErF/xPtY71j4kyhqGWiABQKYptv86u6fGkNhTihK9dtOuKcIIQYh0CniSK6ynKY5quQS04caBqlgVxw=@lists.linux.dev
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759711085a.21.1795378176472;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759707985a.21.1795378176005;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:35 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 3/7] wifi: brcmfmac: detect AWDL support of the firmware
Date: Sun, 22 Nov 2026 21:09:26 +0100
Message-ID: <20261122200931.2090372-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-4-dev@deq.rocks>
References: <20261104151547.70333-4-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:43 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
> Direct Link (AWDL) itself and announces it with "awdl" in its
> capabilities. Add the feature flag for it.
>
> An AWDL interface is created with interface_create version 3 and
> interface type 2. The host gives the MAC address, the interface index
> and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
> definitions for the interface type and the two new flags.
>
> The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
> every interface_create, including the version query, with
> BCME_UNSUPPORTED. Keep the flag only when the firmware reports
> interface_create version 3.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

Similar to the previous patch this one hits a conflict with the
EVENT_MSGS_EXT feature. Rebase needed anyway so this one gets my
acknowledgement:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
