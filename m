Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551222;
	b=5P475U8PgJXu7GAeoY6IkXUZ/Oh4HwqBrg/OLD6ivTB5fgbDkhF6jvhhzz5xg+e9zGUy
	 Ju9pPE8ICf+q97Ve83bILu39pJEv45qoWNWiRGylDyfB6qPliKzObVeTM0Ehy1WdgD0Hg
	 luS9W/+geNFo7nCAUgNHroVB17tLsdYLZgxZ5WhrviDaqYT4UXTall6QQgvuOlsARBEYh
	 4r0q2di43FOESzebJ7H2ZZj2zdCdcRI8noA2fJ5i5qcKhqpZfml/oswwRBP7/bRywS2nI
	 b9yCLfwq8rPd48+LMCaKMtkvd9+HczbXGFKX4e2rOQuK+/SREeSd4wAlgvZ10NEpOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551222;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
	b=j9jXD+76VmZSZZGF8afEzqiR/WxeIEYfZUosVqqasbtKMvZU/qhyOe/oAxQ3HAEZx7Da
	 3rHBoXvnYXd+oEBjB4K+0xiP4xkAtJKLqzpIdGKS9av02WrU1NmMXyX48Wqx6SlWQH2RE
	 llUMnN5/oPyGzxLkXTINZUjvCYUvv9CwsZsnnHG0mQyXTJomnq+fvKR2pmfZ73I6N2bvk
	 00ZCy5z8cp3eOAFBChVdf2aB5bKpaRfDwBmXxnRDQcLuCeHOQQ0PRdrEsYMALWxFtKYOX
	 MpMQM+gvqo6oDglRbXMa0+kyg2pNnKtXBeJ62pK7raf6rAz6CRcPeDrUKYhpYIolapw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bUV07qIh;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0725F606A331
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0725F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bUV07qIh
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2381246a91.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551221; x=1796156021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=UBy2FmlnDqaV+CBj1cURl+AzfOCCscrEkl3wY+4j8Fp+GkxoN0Qhb3KCnkWg2AD6YO
         3gCJrtFSjes+I2Nk5BPCZHL1dOmVE5vzfozQf4pwLLSv2riiYUSV2Q7D7NezVnbH7Nju
         Du0RiDJq8HVn8WgPB8P60myLmZ7NLxC5h7UhiGE8E1wnuLqHWsN/+ht5jvKddU25MN3D
         L85HXEc6fZflBFSTfq3HoG0vpGG+ADMri74t58jLewAtW/wvuVzELpjDh9S/7kEBtvZo
         rbRRGzRzIlJHrkI5qXLCfaE5qLlnUuEPvZpEHCw5hUVKPtSw2osaq7bd1RSrnbST8PX+
         rauw==
X-Forwarded-Encrypted: i=1; AL+hErEczpvOf5NjAedtC2e7kZlPpwMQr6y/wyaRVsxNRWvi8d7hu+L/goUUmCNnvlEt07YEbePIwHV0c9M=@lists.linux.dev
X-Gm-Message-State: APuU4Z/EHr9cbx+BBqzvPjvAFX3NqWAOwliFFzUtjtZad4rjnquvc4RG
	Nz3p+vv/BcGzTgyz1fQALVr/B4B7A48m7XCXW9fjvyKRTRJlBjsj/sJWwSBAIwgEKlqjlpVsLIE
	8F5yFMbHXP4PUxguETTCqrWBTcqdWeXIdv5E/XL5wdrQbWMWwzJ3lSsrV3r5fZzi1u+PWIW5t3H
	G37LAF7v3/VKv3Mre8qbiNPlcH9xyQwS2c5jCW/Yo0IJHw1TCASP/TYBqjbb8Ddxl3BKsuQgDeb
	HFv1Tnfp2rTVwU58NE=
X-Gm-Gg: AZFdTZdDRDHv8dIVAH5XhNpzp9VsrrDKEJAePENn3gRobXpGO5MACPIgXhJSrSvTEtB
	7uJYnZ2KblzT7nJEbLcw2V5MHap7H7hUisMf4HWsx2xoJOdmG5z5yFPc1VAhUDxkPk3/0YM8Ve6
	XTvcrptZPhzzL3ti5Bor0u/kReyAtxwADQKIFzjyo/w4EyK8NZDyxwAk521mAWyqXNbDwNbsP7U
	ItUb8kcdIKbt+SMpDcanSzLd9RfA3P/uB31ebuM85gxjrtF4hT5ANA0BOVfQ4DmVDl1DkwP+upW
	yqrwzioZloZfSwtdEkAnrEZOmt4AIyqoD1DiS+CMY6ntBpMT3MoPemPLFpU0tmuapRNZTW/hQFL
	NpM4/Jjgr0+jiw4sQcuT+GTypFzBqIEmN4jhQNKsJWYx6AWJPe3PZM4LddN/nn0DxoPj57sFL0d
	vuNfvbph43yCLh+VlcKEOy+ohsVYwpcglZZCNXK78idQ==
X-Received: by 2002:a17:90a:d2c6:b0:3ac:4e18:237c with SMTP id 98e67ed59e1d1-3b41c57565emr14196935a91.0.1795551221349;
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm12292455a91.6.2026.11.24.12.13.40
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so33806985a.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551220; x=1796156020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=bUV07qIhsr8NZZ2K8U+v7SFfzwGO4VaFWDeF2WX0PxF99U5XbtlaiHsOiQwiiFhgXt
         hthORWEtd/ijQbiU+1QUYKl+Epe7vcTFL8cbhhKQ5Rbbb2a4+DGG+DOt6E7l3q/9W06E
         P5ibo0xRw/rMH6KEpFuUMTj+GenC1fjF21a/4=
X-Forwarded-Encrypted: i=1; AL+hErEvpDkScBCKCzhDsJ3a9rFqogXDKwHCqKoJNZ9AzjRE8Kr9odoc3Tdsor4rLuLEDHyLDXYaj3gLjgM=@lists.linux.dev
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866153385a.46.1795551220199;
        Tue, 24 Nov 2026 12:13:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866149285a.46.1795551219842;
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm80768285a.28.2026.11.24.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Tue, 24 Nov 2026 21:13:36 +0100
Message-ID: <20261124201336.3493037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141024.92354-1-dev@deq.rocks>
References: <20261118141024.92354-1-dev@deq.rocks>
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

On Wed, 18 Nov 2026 15:10:24 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK and, with "sae",
> NL80211_EXT_FEATURE_SAE_OFFLOAD_AP. hostapd and wpa_supplicant then leave
> the AP side of the handshake to the firmware, which doesn't complete.

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
