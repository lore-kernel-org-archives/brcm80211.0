Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709696;
	b=ip6wbzs8MlNvsVdnYhdizybqCy7n6NAsM+2FA6KSpzS9JZ++gfpv4RFM+9ZAwOmsTc28
	 MPQVO+TsA+V2h6yomsfSfn5h3wH8KqWyV8WINetYFADy0h4NETRXqNCEw/zw4jkTHDzus
	 UkfkCWwBEhoH9A87T6HoT2degCXx61TWsXFA2ufQNEsHHCKGM/LYi4xbsFIYxSxUz6UZH
	 Ps1xS/6W+DkSn24T8p/Jxct1Xb7OQMW70R7ChHyN6QQ0z57yJX4h9LWCAaxzvJzsm0ELh
	 djkTqpoQnwmdvpaW5d9fwYJL1OYj1fcFwhRrJOZ9ugqyZpxELZKMLHMv9/Oe6sHSrfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709696;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
	b=b9byHo5twrHZzB3cJdF0rsGO0XagzHlRwH2WCp+jqxs11UnwOWt5ykWRCjATJ/fPf2Kn
	 unlebOKc1cjoBexsxeDmpLY8Olm9yZPhwULri37hJi9oJb80D4PQqqZqiy9iyHPm/+XnP
	 zP1n6O4Rmb+qdIb7xXrikj6X/FlpJI+6rSzZH5okpsjL+Vj4GwUEySodbE3NjrYrcgujE
	 v1GTxyOk6p4jqgNHxPBXM+gL3q9ipXY/x4BP1MmLevnS+CGhtg/KGaDv8zCZnQ7F7Thro
	 Tb0/7SZi6PI75M9CIE/goaSzVFEZmGMBljMZOdBvgShQhuiESXh6BLL9xuQ//De1zbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dkRCC//c";
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25842606A6AA
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25842606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dkRCC//c
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so3679870a12.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709694; x=1796314494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=jKFblGUEk7cCDkl5aNj72S0QBBH6UwF9ju0nA3VxAqtBriQZcPN4cZvvY4VoIFpLXa
         YgC1ThWDYL2ON6gRNSghRErjLWb4W9nIA7rn1o/nNCrNNMkGY/GvfboED6IXB8D/kyJv
         xciRKHWJjJisLxD/YElAAx6f83fM4cEMHHP9WYPIqDgoGRkYnrWGwCmCdjd8EmIVHEz6
         J2NvD80EgNaHjbwTgKT8l+7mzCFoKaayalBO6iKZ/F21z2+rVpTnNgfGJ7IWkQEZQpLq
         3qNMMwe2CqbpvlsHQqceL2U8MmhbiFsUA1nO2IzMTLKV0UtInPacnoWBzCMh9yzFFpID
         CoDw==
X-Forwarded-Encrypted: i=1; AL+hErEEXA2OmhkuQQ16OASozidcTrBRf6bSXI7vHKsYjVlimCZAdb2w0JvXC42ZpZVEwckqxaWgkzhjllc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gZHg7Tku3yLnV0IpqLn51lBdOQQcZdrLwHtnZmFIH5aZWD5q2
	XY3YXPVnTKtp7G9NGxPbQhI3UekY36O9KT1rkbzlKxRGWfirGfjYUTuAkCdOnJOCraae/bqegCY
	Rhy17FACStpp8gveJEYgLeLbYG5yZOVUFvvE/aIWyCu43TMQAAijo/5pZZBXltMYK/k6NxKMrUL
	fFq5+WTo0NVqLscTmWBBkQr6JE2D92MIslXAla60hyrDR/bXyjwpgYde/V7EjdJaYEatH2TU/5j
	bVv+/9E7hk0N2B3+jQ=
X-Gm-Gg: AZFdTZfv1nNO6bHTUjsw6mLrzjTTtxBA/xZwVs9PdLF8QoV2PgWfBTl0l6GzVd74H7w
	qw/KgP8UakSxoCQmsCuGBCTxjgavKwLisgNmg3RsesQ+IyTuMhWgaz5VaIP7hyMN2heC7cu2lIH
	50Le8ITXOyF+3b42+ZJJYReMF6TkUxOGmGmsHQs9S4PMWTHNq3a0YqdLSvGQjhZZfkooNUBTh+F
	9rkEsdM2H/ePa9EnyatHlKqTczYNVJnVN/Y7csHRhw9EjUNqCAd4m6IzEAHXR7XbDME9oSw6/Kq
	H32nCdKQHMEZ8IzuuRT5tpaLX0oQV9KCl6n7pyEMDu/pOydwrCBYqjW1F8pXr8Kz5D2vhUdpsZk
	nYDJG6Cq0V97m8MZfeDKb0Lj6vKoFKw1IkirRmtY3vf5VjFuosMaQxpilVg65HEZcCs3Fv3uaR1
	Pp2PJmvREjVuK3EZ6cNsTDcpjHmsi/4JM2DoUhRfnYqg==
X-Received: by 2002:a17:90a:d2c7:b0:3b1:21d9:4c3d with SMTP id 98e67ed59e1d1-3b41c9324bcmr19359638a91.39.1795709694316;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ac84fd5sm15478588a91.2.2026.11.26.08.14.53
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so1084402285a.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709693; x=1796314493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjxg2e0aBeA+BIPDTWMNMTTxa9DV0gJVseB7zst1XI0=;
        b=dkRCC//cyLSZlYcpe0BWUKfn6iZWvnI8ub+92cRLEw7H96+xrQLyq53qUd9y83Y7ce
         Y6VyXAJ/LToiGq0UZ1hKGW6GhYDfFuEiTLpF5KX466tDXVwjUcrdmvKiZX0tEpla2mjf
         11vbIwdn+17qzD+82mdi32m9hfvgeyumetCb0=
X-Forwarded-Encrypted: i=1; AL+hErEXvcKmz0JGpDOj59h08qBPxHneFg+aIgTrekR3lPlhdzVz/6WfSyzjSQz9CDTNmhY9gVMZydV0hhE=@lists.linux.dev
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743262685a.38.1795709693223;
        Thu, 26 Nov 2026 08:14:53 -0800 (PST)
X-Received: by 2002:a05:620a:2b46:b0:93f:3e45:a419 with SMTP id af79cd13be357-949ba9b34e6mr3743259185a.38.1795709692822;
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 2/6] wifi: brcmfmac: detect AWDL support of the firmware
Date: Thu, 26 Nov 2026 17:14:41 +0100
Message-ID: <20261126161444.2484980-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-3-dev@deq.rocks>
References: <20261125190254.176055-3-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:50 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
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
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
