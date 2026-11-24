Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551214;
	b=Z48PHRG5kK+oQXdMTg8uks2J0kAEesgJ4L57nGq+1IAS4Euf2cUkNoyGByfUomEjpsMj
	 QT/eiz/rjyhsCG/FfDI8Bei0pgbupdy0KwujrSy9GcAnmwbWaU/3PcuQN81fk8PSu3Zyd
	 yqQYFjuIZWTovzQrFR1wUxkhVAFEq9Q2TimJ9IjsDSU4UmqBVTKEQCjGfCIQKdjmQ7Ndr
	 oTvl/+mVkhapQTiIeE8fDYDoBBLezA9aD2w/TjLEDGuTIAJXLOgIofNiUvaMPV5qOnOHQ
	 kB0xDHBso7+e4wHr9VhRirA/XyTVqs5S63XHvPBuPFM/mkF7A7O77jugfc7mBVfJxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
	b=oIzsDd1T4K7eS8hR/cZMTH6uPg0Nk6s89tjyUUdeyS2WJdcAYjKZi/hkmEobmKMPSTKu
	 5vQyZshJ/G4aT5gISgtX7Jxd6pwVL2Ix1JN/oQ3bOOc2rFABdDL9gB7MgWnuLH7cR+W1J
	 jRQNiBV88W37/mV9WHfxqJ97zwz3OgoR6UK4nn43QbA67PE60fYSmDDCwvQeAz4sfIFdQ
	 D3GS3RnuHmMlgISs1Zo22s1Acb/DFU3OsyQiVBxlDBFY6h22e4tXXbgczKDTOZLCk6JK1
	 6eSo6Tu8kzlD7eFQwC/2kOFzLhnK8wGWxy12mzzjrBzT1or21bmOMqbb+m2XKGh/7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fjhNQ91W;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84333606A323
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84333606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fjhNQ91W
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cddc250d815so1940713a12.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551213; x=1796156013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=Q6yn+0F6tu1I2CeVeknFz0MR+28Lk0aDiQxVafOXZBxM0uvspbYQG6maBCISGeRgVX
         bvpdXlcBYmyBWSW9Cg3jiiF7CjtZXwD/OMQ46ftO3zgZRusgoj7C7jX5rJ3LevnWyeHp
         +xUF6ZvgAI+aLDREPS2pvl8DpvbPwIiJWssJeT/czQsp0V3n+4uOGwBpUpF+GMpIbLAK
         Fd/oIN+rKlRj58JV3/PWODzuYcplFqBJ3gggM5lF2NRMbAxqEhX5b8iGYJdHpVUsQZ2V
         EeMGXhRYQLdPinuIGD4lUGeb2VzC0e2MS23CDuonN6wIjdKD0tNVhP0MiyVLEP6yr0xz
         UvAg==
X-Forwarded-Encrypted: i=1; AL+hErEtR15Gxle9A/H489zoFQLZyM6KWdcxEXPWOUSdTUlCxLc+7ZeZW3W2NHRSW2VkJ4bLvxsU5XHNr34=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Ey6FU04ZZQAxOQw3MvO6W5wG5poswJQ6AkeIM+7zqvAogvi3h
	30IKkoSZtJ5wcLNjk4JTddhtsKZpjZVEqoY4WwyQgcSwFQ+z3Vx1BQU1l3JXTZA/RDNSEdFabvE
	6y8ITcm32rtLzfW7qZpUagnrrTFJ+gxKJ/P3QCSDk6uP/yDL6GuE1jxETjWzNqJ3mhqxH14D/5q
	K58U1ctG9vOQWbmWNpYQ4GyzrGDnlOdGnnUxdqfU2Y93NV4sSvz2GNkocnA4JItOpUZIXLf9KT0
	wprOwr/s/elrLfJNltyCQ==
X-Gm-Gg: AZFdTZfF7+qx1nIniVu1imJHr00JNj366Aw7gQjTIycgqFkJstN3zUIswOgj0s1JG81
	Ago8l8lOSQb1VjxSgYAyUKeKHNGCj+bwVSFzMcrmwpUcoPoxK7ydbZAooCI6FAYXJxaFM3khPcZ
	ueOAECfJ5AeHX+ErSphT0V2hoHpLs9+NlfBQSPPwR2Vhcc3HD7aikXAMJR4FhatjIhDZDpCJiLA
	gbeUuxFEaHP5WMsF3eieOZYInmXOBO1U3OQ+8sA4qDgjJCTeu6Zjxr4XrvFThSCTDPAeVZOyZ34
	B8y9wDd6S2TYdg8pwVjQL9L/F4IPleilOaA9A26S2Ym2e+B5O9v1jcxwUdkhBE2R7TR1vvs2V77
	XPW+ToHCWxJs2l6VI99mJDI8N9QybCnEL+n76aCFvF2k2RWuGM2n44AKhFzU/WulUiyYxG6zC10
	q+2DKcjycvqGhXaJxq0Wt9jxvi/KXRQ109+6CDriKpEw==
X-Received: by 2002:a17:90b:390b:b0:3b4:1220:36fa with SMTP id 98e67ed59e1d1-3b41c7c27e9mr15078418a91.5.1795551212800;
        Tue, 24 Nov 2026 12:13:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm12292230a91.6.2026.11.24.12.13.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso35089785a.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551211; x=1796156011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=fjhNQ91WN92y7ABnaPiPkmjHVM1Tn5y1PYb8niBSLmDHPo1yCrVR1FWo8GDAw+i51A
         1mjOvrQ36whfkvYjojfzjaWmI2vwODTUQN5ZWvKqpkMYSrSbSDmdIIJ9FR82xQqkxVBo
         72RBdI56BljvJVOIfst8iHTXEdlFwEm8WAwJQ=
X-Forwarded-Encrypted: i=1; AL+hErGNuXrB3NgNsZg+AcPOlNL5+pZCYXMADWlGckQbXdis9Jg4UzX38+iE01EoFCt5x26fZqPX6tmRmWg=@lists.linux.dev
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635395085a.56.1795551211448;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635390885a.56.1795551211025;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm1127270385a.15.2026.11.24.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:30 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Tue, 24 Nov 2026 21:13:27 +0100
Message-ID: <20261124201327.3491419-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116041534.24-1-shxzhaosr@163.com>
References: <20261116041534.24-1-shxzhaosr@163.com>
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

On Mon, 16 Nov 2026 12:15:34 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Fixes: 9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
