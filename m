Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF71D545
	for <brcm80211@lists.linux.dev>; Sun,  4 Aug 2024 11:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722769468; cv=none; b=eT9gT38G6nywVtdG4ou5NCZ+b00ubEfl0a1kikAz/grDfCtZB+ClGxEY+n4pDrIUm6vN40pmMnG2mcCXb5qA8yS0nL9aPF7M1Z8nGDkB+hqS6BUWpkHOKR3Nq32uT5PJnVyriY923Ia0Bm9qNy+wUIPuga/QEaqlWUvfFQ6VTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722769468; c=relaxed/simple;
	bh=y8faSsy3GMkV8+GvhOybBMLzLnoGhpSAV3sFruwiIFM=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oZJBVlwXjzqAGyyhb2V0XwgqHDszrEhMU/5BuVaIwCQBFzVlyde0LC/QE/KUewQRuuUYyA8r05SH+vwNwOgMaQzNU8hncaYOWd0Tr1yiRlCGSBwvtXUR3iarWZwnTZw/Uqxqw+GMSK01ABPMbChCSSr5oQElTHHe8L015QBE704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FL8Kkz0a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FL8Kkz0a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so14091328a12.2
        for <brcm80211@lists.linux.dev>; Sun, 04 Aug 2024 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722769465; x=1723374265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdhNjk3nlOQkHBfzhb9NvFAahhOzsHQURPXiWKXebgw=;
        b=FL8Kkz0a4sODa7tLeDT4LmIMJgfEUfstJ1LnGhGyoyX4ISMM9Thdy9tq5saF064ysI
         kkG815P2SP/Q0mKTw+WwIaS5OyXG+u7Xv/6XxGKEEv5Dny5A+qtkyqHm94Hfim1tQpHd
         mYkUOT5CGPQwomMZzcTK53CsGmENCHBo5ljp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722769465; x=1723374265;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdhNjk3nlOQkHBfzhb9NvFAahhOzsHQURPXiWKXebgw=;
        b=jOrvphz//f01YcL0icPiMW+VOpZHtis0OvImBLkedt4ViV8F8ZW7nR4twTfrGYuobz
         Xo2Xt6LSOEciDZJQn3wB+NNz1Y73E24s9DDpFFDX0xyHrb5BJNzP15/mYeFMs4hWKEvV
         f6tcIePTDhEimzfxK5Q4NIthZy+KPu6LMZXAyi+q4nLQYJBtViWaQwf9dQ0xaupBJFHf
         62IDgE63nGFgYTU8I+ztZtdaz5DFaXkFlR4WmvPTTbQPq16GEsBdqdyZ7fT91z6RDgqb
         9DTTMhqQa5fR9eH/YPagpFDGnjdTVtdJyJG8L9TyuQZlgAi+2VZH5JC2djvouruF/KF6
         YZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCWmBeUQO8i7w8g4lPmXAuf/8buqz1pQoyl5pR+IzJ/wYuS/GjNblvedcJsI4Eo0JDg65Xs8d+DkQXu/WsNhgRfejXmreKJJG1iD
X-Gm-Message-State: AOJu0YwHSQyov8t83BbBvGd7kj3aN7NHoCcHszN8QQQZoNYmAwOHS285
	ktZ9WQEECrgX4VAxNiUSpkjnJX2fY1vax0PQyapS9rrDY7oyIVOIoDzoQCf7Dw==
X-Google-Smtp-Source: AGHT+IEFqAVqs9u6rzoc50lPwUIjKavo1CRQSGr6cYJBJrJGT82XBk1cw13Mtd2Q46406CN2I5y5xg==
X-Received: by 2002:aa7:df97:0:b0:5a2:68a2:ae52 with SMTP id 4fb4d7f45d1cf-5b7f0dcf294mr6016827a12.0.1722769465200;
        Sun, 04 Aug 2024 04:04:25 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83c32be67sm3453474a12.97.2024.08.04.04.04.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2024 04:04:24 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <gargaditya08@live.com>, Janne Grunau <j@jannau.net>, <devnull+j.jannau.net@kernel.org>
CC: <asahi@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <kvalo@kernel.org>, <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>, Hector Martin <marcan@marcan.st>, <stable@vger.kernel.org>
Date: Sun, 04 Aug 2024 13:04:25 +0200
Message-ID: <1911d0fdea8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <MA0P287MB021725DE596EF4E5294FA5DDB8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB021718EE92FC809CB2BB0F82B8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <306c3010-a6ac-4f8a-a986-88c1a137ed84@app.fastmail.com>
 <MA0P287MB021725DE596EF4E5294FA5DDB8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Handle SSID based pmksa deletion
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 4, 2024 8:27:04 AM Aditya Garg <gargaditya08@live.com> wrote:

> Hi
>
> WPA3 is broken on T2 Macs (atleast on 4364) for a long time. I was under 
> the impression brcmfmac doesn't support it.
>
> Anyways, I've asked a fedora user to compile a kernel with CONFIG_BRCMDBG.
>
> If you want logs without it, look over here:
> https://pastebin.com/fnhH30JA

Not sure what to make of this. The interface comes up without any obvious 
error and then another interface is created by another driver:

[ 7.006441] rtl8xxxu 1-8.3:1.0 wlp0s20f0u8u3: renamed from wlan0

That interface connects:

[ 9.103599] wlp0s20f0u8u3: authenticate with 98:da:c4:af:1f:c2 (local 
address=2e:87:9a:a9:38:66)
[ 9.103605] wlp0s20f0u8u3: send auth to 98:da:c4:af:1f:c2 (try 1/3)
[ 9.109051] wlp0s20f0u8u3: authenticated
[ 9.110202] wlp0s20f0u8u3: associate with 98:da:c4:af:1f:c2 (try 1/3)
[ 9.126945] wlp0s20f0u8u3: RX AssocResp from 98:da:c4:af:1f:c2 
(capab=0x1431 status=0 aid=5)
[ 9.127678] usb 1-8.3: rtl8xxxu_bss_info_changed: HT supported
[ 9.128606] wlp0s20f0u8u3: associated

Is brcmfmac setup to connect to the same access point. There are a lot of 
unknowns here.

Regards,
Arend

> ________________________________________
> From: Janne Grunau <j@jannau.net>
> Sent: 04 August 2024 11:49
> To: Aditya Garg; devnull+j.jannau.net@kernel.org
> Cc: arend.vanspriel@broadcom.com; asahi@lists.linux.dev; 
> brcm80211-dev-list.pdl@broadcom.com; brcm80211@lists.linux.dev; 
> kvalo@kernel.org; linus.walleij@linaro.org; LKML; 
> linux-wireless@vger.kernel.org; Hector Martin; stable@vger.kernel.org
> Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Handle SSID based pmksa deletion
>
> Hej,
>
> On Sun, Aug 4, 2024, at 05:10, Aditya Garg wrote:
>> Hi
>>
>> wpa_supplicant 2.11 broke Wi-Fi on T2 Macs as well, but this patch
>> doesn't seem to be fixing Wi-Fi. Instead, it's breaking it even on
>> older 2.10 wpa_supplicant. Tested by a user on bcm4364b2 wifi chip with
>> a WPA2-PSK [AES] network. dmesg output:
>
> On bcm4377, bcm4378 and bcm4388 (chipsets used in M1/M2 macs)
> WPA3-SAE and WPA2-PSK still works with Fedora's wpa_supplicant 2.10.
> Fedora's package carried SAE offload patches in 2.10.
> wpa_supplicant 2.11 still doesn't work with this patch but it prevents a
> kernel oops after a disconnect (due to an authentication timeout in the
> current broken state) in wpa_supplicant.
>
> I'll continue to debug the wpa_supplicant 2.11
>
> best regards,
> Janne



