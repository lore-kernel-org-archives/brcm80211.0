Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551227;
	b=cihO2No/NnUsD4H2HiHD3nFiLx1GNQWQAZmzy4/g4OafjwzreF7fvwxV75rF8ItRn0yy
	 bJJgUV4fbJYYE9Df0bU2FThzD1WiUq0FYxkmNNZOWh+aQd6PJQyzzvmAuTO6mzWDAFCE7
	 Stp7v6hGLi8O54OpgfWLP9G6BcwjQlW0pbcGiPYT1O5fyVdNmcLTuM9RWT6L7mCSUp7U3
	 GPnhWhHLMG1GbsUHpqL1aYxo5DnLrCn/cO/mRh/ubSjNyZMaxQEBmxD/YpDxQY0R2iRU4
	 dR9rwOj8emgyDqFsNOEJ8fDxrr/+/0U9IuO+Bl+FtLStUxq3Y8D2JLTpVUcgHey0x8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551227;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
	b=a2bdCHrP/DChRFGqieU4rhG0BAF9aBPelJnpYa8/sHvwH+vT3d/iFZ+BQtzd2ICFZjTV
	 sg1/Lo2vCpqCgvhXippuit/YoL80GpVGcDtr8z8ujXqbgKjsmwYEPv4TG1zSiD4QoxcZU
	 eGvpKsq0iVJBzdGm2tTeCl6HhQuAmnNG+6wHjxM6TuAEQNPsDmNwSnaJ6gj4ey1/kZHcy
	 k/126dEVvbvhchAmfsl04oHHF5sP+t+jnS3f39UOmHmXn4skBphqdt0JHFSqjITx0gzGP
	 rOreJVH7qfMx5Hgb9v4eWuil/tBIOv9c99exwha6K5GiaGYW6YfIyu+01DgAU6Ic+tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iFmHDXHW;
	arc=none smtp.remote-ip=209.85.222.100
Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBC606A327
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEBC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iFmHDXHW
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-99ac154431bso830165241.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551225; x=1796156025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=lAq9zRXmiaDOHwhDyVAMyeDHHq2Oybe3UPhUxgYn0lRsuA2Is5ZXyNIIrpPm4R71nJ
         zSQzsRNjVn+Q8wnI0C7000oz/Y7/iQ55yMfeZwM2V9i64VOjLiWFo07Yo/s058CP+8q0
         gMMaFLPlfo9tmE22fI3GgZz2n1IyyyspUM2/JJ9QNuFuSJ6D0RPDj6uvl9K2EKPJ+Gzh
         jZnCSjRkhbV9nBL5JNgsK5iXpc0/rdyNuDuHhJzrRidHAZ4ohm75O0znJOCjmZ8npCGl
         J4E4HhNYFuRI/zF4XSxibli0cDQpn6AyYVidmjnAapHL6CkGHxNWLIAameWzF0FAjkkT
         jMXA==
X-Forwarded-Encrypted: i=1; AL+hErF22wbZQUeTGB1Wyo9prp4Zz+QDReZvQzNAYn4kuafghks+UE6TBkd1diBuMZclopm6fFuaA9xRjx4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZGakqEa8bZ+jBOVC75biEewZZ41DEBzInn5V6A1l3Pl3Sq8tL
	ZBvOBXXa+o55iU6CZrYjz4m/lrCcMsJRpZxX7MeQ5JbaB3CInBkwGB2vwJwO2aE4u504lwB9XSS
	N2eWqVPiWJ2kqQl8dAumKyELmI9wQFnvTzGn7BmwdD4ip6X/1W4G91SbLoNvfmA5nZUJtM4GL4T
	EwcQ3dC+3LwRVupyHFOukhOgDu0yqIOZVD91yShePELDVm5RFY1/tE6IR6/ScQXppUqkJIAtYhh
	5l6y1BQY/OTDaWURXA/ew==
X-Gm-Gg: AZFdTZfzVFpU0kju9jgxqBirsOGZtQQpxK9Qx4qf8CT7FhKtliqZtj3bt+fjffooIZR
	Sp2im8+W0ETgAXfr0neJXtFWDwTf2FXr844Bm7ong+1savNePsaTfXe0dSMNt8sFN/oOEif0O/2
	H0m7C1zRbuYDmd8hmWgksnI2lOOHG3CeQRJHNHRx/THjZOTLKw0jGBNyXXOhXcLcB4il0C4zaCr
	fLuKrrHszKt85hiPLWBsRrQgExD4FfDQqPJ6Zunuuwj3m5j31D/OFyLWdk8W5KSzQuI2lK4BETx
	Cdq2ms7baAxH66kbGVDvn1W9nwQt01Lt4U63Ay6MPBNExHCRBjFN9912C9vypHhyA+Bkjo/xrVj
	JYaUAKhNr0yWxCcr6Z2R1eKug9c4SCf687pAuqReUBFBO3K6uCDGqsVyrYCOUK0hx2mvfffLVbv
	TPJEZt0iuOaAL5Iea1FCvlxiqQHdr7FUnKlatmbGpMqA==
X-Received: by 2002:a05:6122:3d11:b0:5c9:a60b:e5d6 with SMTP id 71dfb90a1353d-5ee8af30e79mr8825141e0c.16.1795551225327;
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e1b3904sm1629573241.19.2026.11.24.12.13.45
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92134f1eb00so71898756d6.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551224; x=1796156024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=iFmHDXHWQ7cHxqZv/I6Z3ShgusEUh+9rOBfa17Xu80xYjmkqHZdCzDVAariodYm5jv
         zxE38jUj47YW1l7MwFH1AKS2gxXcrKupTykkCLXT62ASHVtgI2WExTzb7Gwj2t2NwVn+
         LJnGLEbfBMWJ7Diin5gRyTdnhdBwUPWXC2KC8=
X-Forwarded-Encrypted: i=1; AL+hErH4J/PKi2gHHOU5Nv65M4n11VB+3K1I+j04dhhHUQAEvZDE+g2649AkUFGS223UoFj77jqqcf4eylE=@lists.linux.dev
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262796d6.46.1795551224477;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262316d6.46.1795551224014;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b081csm141186546d6.7.2026.11.24.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: turn off TX beamforming on Apple BCM4364
Date: Tue, 24 Nov 2026 21:13:40 +0100
Message-ID: <20261124201340.3494125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141020.92306-1-dev@deq.rocks>
References: <20261118141020.92306-1-dev@deq.rocks>
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

On Wed, 18 Nov 2026 15:10:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac sets "txbf" to 1 at init. The Apple firmware for the BCM4364
> (9.30.514.0.32.5.94 on the MacBookPro15,1) has it on by default as
> well, and then rate control settles on a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP.

[...]

> Set "txbf" to 0 on the BCM4364 when the board type is an Apple one.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
