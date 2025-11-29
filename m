Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B9279DB7
	for <brcm80211@lists.linux.dev>; Sat, 29 Nov 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764417572; cv=none; b=kbvFYdXUBEWcrU6YsfElTioGMkxSElt0QVd5addYGQ1nRL+ClpqwSC21rAS/oX4uEjyjn1EcZxlU/ha4fNTlLbpRAcnLTHJIj2HghGhC2hOs5EEKfgZfzJjz1KZDDXESXnACguhBE15J3jfqCESnoHeSUMvuZcDPmW5/jh5OI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764417572; c=relaxed/simple;
	bh=U1Ssw4lZ2jfp1OsVrnw2M/14omKMBGMOxTLKnTRh4hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmYNZmKL5jehIeNG3DVuFbBiFRI2z2CokMC/9jib/bZ0k2nesCtPLgAqDD+F6KmT2FbJE4zl3gB6dav1y1T08CjX3GtCxg5QUGFpgqSOS5beuvxoJf3yuf1m0MKIKGG7NLiRHce4sF8P358H6z6/QvoLfdPTKoV+sTwMOTDKqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GcnqMYLv; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GcnqMYLv"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso2119702a91.0
        for <brcm80211@lists.linux.dev>; Sat, 29 Nov 2025 03:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764417569; x=1765022369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AMuZ4MA+cOuMgeux+0oZSodeGOO8PZYtmnxDebxkm7o=;
        b=s/8gEOeu9BrCadfOJHCMjI3wKiG2yLNdCoM0zVmkrh5AWoupQWIbhoKvJCfumugyqa
         jVZgkk07WdSdFlwWIpubburA7B/A4xJLZEPAAmgqu7/YxF5tKBzyePvMvwNEEc5OWNuJ
         yKGi+bEIz66nbKBF1q5YpkfR0o4zIz8w7UhFLLGq88IFbnjQ9G4mjDayjzdgmYUZLpv3
         8ogg4p9LPS/uaAKxD/LkfTQy4dbGdOEhc0tIJzRgAK9RPJNpLjE/eprPPQChP/xCm8qW
         Crb7Uphjz3pUdJ4ydpmRA3RSVvNmWVQrWBU5rf63wvvCYHomdMG8C4E9zyBC5AYH6dIr
         Lp/w==
X-Gm-Message-State: AOJu0Yzvz0h2nVgOWpQwFB7/1WuS9fEt8XDgIaNfXfDrCEqc1ifE3sEz
	yMTLUD/BWffmPRfsNNI4/ASQDqiXahiCPXqPQ9C3EOFQmNRj3DwF/EYk/acCf7NK0IV6P3EM1+R
	mZEGbpQc3dUdt8kxTGlVw4h0+XrTpjnmZeRfR/NS5TAifBD5nkMAvvPQXaOivirbHT51fyDOuzr
	9C0e+xreXZHBvUG/CUlf7pK9Q2s4VYjbv9vhar91e6p8uwnpXlL2pza27/lKsX+pG5U6XHjDKxE
	rkLdncMfeQxQepjsugQKA==
X-Gm-Gg: ASbGncvYp70m2En24ty9aOrzYqSVkVckWo386LlYIHnDNRqvjfAljd1Daadn4OLd10h
	iOh+39+VIDFXN69h+u8aPeLIdXDQxMEQU99P8yMtOqnspVHoWB+owFCEQJwfDYtfZoDAQpfU7Ul
	akaOKA0jn6L0mIF6oFgk0Dgt80fW4gO66XcFQz0FX2guc8KaWuEn21gn79oipuOiC+r0yQo5ivf
	878OnwpC35RwSFpQgpFRCsy4NP0uLRWNHeJwulfna+peVevPlrbnHSdagYsd9ixh9f4OtsFr+PO
	FCX4lHF8xKbkOJwQKho5Z/SbhcCKf9aDrQICYt344qtGQm4Y2PiWGAVO19ZG02he1h6o18Dgxa2
	Y+OizTa6Z3kcAtT2n+nrtR5jsZ59dE4mSzDH6KeZXYiU4HaJDfcWKb0gzW3pTDj8ukguc9PowfC
	CDXiuHUp4Dm6CHSSY3INcBlEbfjaANsNolSJ6hhKbZg+JHG38y
X-Google-Smtp-Source: AGHT+IHI9wDeJwzkHOflB2dE9MP9/dAzdUdqM/yuzTcZ+65yQ8Sfo25y46UeMQ0V4Q3513hAYPQR3HYPJr9V
X-Received: by 2002:a17:90b:1812:b0:33b:ba50:fccc with SMTP id 98e67ed59e1d1-34733f2d24emr29998176a91.18.1764417569392;
        Sat, 29 Nov 2025 03:59:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3476a5c9abasm934038a91.1.2025.11.29.03.59.27
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Nov 2025 03:59:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so566675485a.1
        for <brcm80211@lists.linux.dev>; Sat, 29 Nov 2025 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1764417566; x=1765022366; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AMuZ4MA+cOuMgeux+0oZSodeGOO8PZYtmnxDebxkm7o=;
        b=GcnqMYLvvMBkm6DBw5NIRUhEL3Tgm60iI0XD/YeF081abrVtlRw52VxTXUmmUiD4FG
         yl6ENlZ+Ehmx2ZpM/cktgnkI0SmxnHeRcTEE6EJOSAX5ZP483MjdlRmirz7B+BSZFB4M
         eKPirQD4Ib766fzpEZvuQIljVq3oy0DJa6x+w=
X-Received: by 2002:a05:6214:c84:b0:880:80b3:e29c with SMTP id 6a1803df08f44-8847c489816mr497530936d6.14.1764417566537;
        Sat, 29 Nov 2025 03:59:26 -0800 (PST)
X-Received: by 2002:a05:6214:c84:b0:880:80b3:e29c with SMTP id 6a1803df08f44-8847c489816mr497530696d6.14.1764417566188;
        Sat, 29 Nov 2025 03:59:26 -0800 (PST)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524fd33fsm46223966d6.24.2025.11.29.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 03:59:25 -0800 (PST)
Message-ID: <73783333-658c-4d84-ac73-e9932fb22d64@broadcom.com>
Date: Sat, 29 Nov 2025 12:59:23 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: fix/add kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
References: <20251129073803.1814384-1-rdunlap@infradead.org>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251129073803.1814384-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/29/2025 8:38 AM, Randy Dunlap wrote:
> Correct or add kernel-doc comments for:
> - an enum name typo
> - missing struct member comments in struct vif_saved_ie and
>    struct brcmf_cfg80211_vif

Thanks, Randy

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
> Cc: brcm80211@lists.linux.dev
> Cc: brcm80211-dev-list.pdl@broadcom.com
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: linux-wireless@vger.kernel.org
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
