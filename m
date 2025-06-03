Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FDD22D4F6
	for <brcm80211@lists.linux.dev>; Tue,  3 Jun 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956668; cv=none; b=f0wZgYtq0Dxg5RRNQdN25VvbxFATDOviEOimh4DO2ehDf2EYvXi6qs0O8sj7eWCIjFI19lSAcLppRP9d0ZHPbAGrmM1Ugpv+FVnvhdNnjKlCZaUCXV/3YTCs6Whs3lQrvH8+r6LFWkAh5WrVQCDxRCwWPMYenoHy3UFzUS0D3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956668; c=relaxed/simple;
	bh=z0wMJM9XeopdPxUsMiSJupD8vdtn9jb74bquBGPkeQg=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kjjS0ZMB2cO0jvN12m3li+sWmfaEUkttVAd+nPnRFkyZemenYcWvOGdLbg+wHS53sAFeWhsguip2hoJsGeq7mtAyA8i2/CNc+G6LRcI1slQ0e65jouO/TxIzFgTs2FHV9FXlF3Gl3kg0LEHJtAb3dzjw8Jo74cYImYT1FzyO9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=el6xelOm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="el6xelOm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2349f096605so68294055ad.3
        for <brcm80211@lists.linux.dev>; Tue, 03 Jun 2025 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748956663; x=1749561463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1UO9An8hDPLdThdGt8VWZhztcb+qiPurIajuW+ZKV8=;
        b=el6xelOmtOHHEqL9uSFJ2gX0zqE5BKa8VOcmzMQWqqxhGkfH4Pj81xTJQ4j8RlQPW0
         Oo4K3EFbqV6eVgYuyihR8K3Wq3I44ZkeJczRGsSgiKmr+yGHKjFM4s80gzwOOshFRzR9
         /G+ZOEnbzqYUA/raT7TZqRR8+dXsEKCPsvfpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956663; x=1749561463;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1UO9An8hDPLdThdGt8VWZhztcb+qiPurIajuW+ZKV8=;
        b=ROiui7zivOvpODgMkRfFKCiuibxtGd0bGufJhXu1nH0dTYzj+5xbq3JUjaBpNSy70M
         jr1ay+X6dY46oqEtuHumLkLRGcfz4cMxNQNimFqPxBigDUbkEbHvjpFWly0J8kHF5Et0
         n7esOcqGiCqafjMr5+v9v6P8jJYS57yDVr6OMlYEdwybTU6zZaEKrZXm1NsTYPeJPLdn
         OrZn5MYIdc2wyEf3KRpzp0Sul/JGVXLEXhOV1m2w5ZRrr6FSJy6Jmqt1UxQqJGHhIf82
         S2onxZ7GWMlLcZNOPnzyy5p8jSNfWz6zzVn1KJCZG4+8luYWfom+dIVLojtuwNvA1+10
         Nqhg==
X-Forwarded-Encrypted: i=1; AJvYcCUi677XBuUSAUtnY9THnbrXPkPebe6AGoNsHrMQdlDymyajEyn+GAHryhpnqL8bsovDFLJvEk2uXik=@lists.linux.dev
X-Gm-Message-State: AOJu0YxitB4KbwF07XN5LpOcftyp6IxCnkaWRwkY+rtkNbG3hX/88zi6
	6FQf0PgwzjVZjBvdskyOM/sW1RP2LuJdAM1tXImU4VivIRYyUsFVzkADs6KNe+wPsg==
X-Gm-Gg: ASbGnct+43MbAH/sNbFITyG80jE0KY0b39Mq0IxgGAWqPJNwldMRa7a/aXk39Z2Q95n
	pePJZqa2D/oOPKiLfrNB3edqht/3+m01WVDVE1RVrLhVZAJX8E00WADJh0HKZz9MQwBlYZzhr+c
	XBRSuHle9pb0zj8Fr4NRbr8/i5XLGhcO/NFmO7djqmegUu6jKdzfrKdTnomdSa8l8HtDBx1xr4T
	ZRPf1ZZ0Ih14g8xFs6YoTJI58NqSR5aZ2pkBToKSm4dtzyMc/dWuy3mLwFNryCMVV9RAmUqxg67
	REHa0qgKBVYamvUEE+hHKwiyQNMJn6gJsOPq05tXTX9rk/RYm7D8ebritw3FT37YWDmB/cIu7Ld
	aBWQlRCHUcSk=
X-Google-Smtp-Source: AGHT+IGso/xoHzEOjZpFXtjfx3bJf3Nin/vWa+Jbo4hMNICpA3pKa5Xf/++49R4Ac5V6ORy61L9rQg==
X-Received: by 2002:a17:903:19c3:b0:235:668:fb00 with SMTP id d9443c01a7336-2355fa00353mr197447885ad.46.1748956663042;
        Tue, 03 Jun 2025 06:17:43 -0700 (PDT)
Received: from [10.229.22.9] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdb4besm87089965ad.64.2025.06.03.06.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:17:42 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>, Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
CC: Ajay Singh <ajay.kathat@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <wlan-kernel-dev-list@infineon.com>
Date: Tue, 03 Jun 2025 15:17:33 +0200
Message-ID: <19735f0a5c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <5095079184a282ae552c50c8c121a632d51b0419.camel@sipsolutions.net>
References: <20250603103252.18039-1-gokulkumar.sivakumar@infineon.com>
 <e36c8a9149f85383b4f3e8793381842088853dbe.camel@sipsolutions.net>
 <aD7mpkhmQXuN9tMT@ISCN5CG14747PP.infineon.com>
 <5095079184a282ae552c50c8c121a632d51b0419.camel@sipsolutions.net>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [PATCH wireless-next v2 0/5] wifi: cfg80211: Add support to indicate changed AP BSS parameters to drivers
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 3, 2025 2:29:54 PM Johannes Berg <johannes@sipsolutions.net> wrote:

> On Tue, 2025-06-03 at 17:42 +0530, Gokul Sivakumar wrote:
>>>
>>>> In AP mode, the "ap_isolate" value from the cfg80211 layer represents,
>>>> 0 = allow low-level bridging of frames between associated stations
>>>> 1 = restrict low-level bridging of frames to isolate associated stations
>>>> -1 = do not change existing setting
>>>
>>> Is that -1 still true? Seems like now it should just be that
>>> CFG80211_BSS_PARAM_CHANGED_AP_ISOLATE isn't set and then you don't touch
>>> it?
>
>> Kindly note that the driver is rejecting the SET_BSS operation if an
>> unsupported AP BSS param is passed by userspace, while the opposite is not
>> true. ie. the operation would not be rejected by the driver, when a
>> supported AP BSS param is not passed by the userspace.
>
> Sure. That's a different question though.
>
>> So yes, the significance of "-1" still holds true, because if suppose the
>> userspace skipped this param in the SET_BSS request, the driver when
>> receiving the request will have the ap_isolate param with the default
>> value "-1". The driver is checking if the param value is >=0 before
>> proceeding with handling it. And will ignore the param, only if it is -1.
>
> Why though? It seems odd. Basically in this case cfg80211 is saying "I'm
> not changing this parameter" but then anyway you check it's value, why?
>
> While we're changing all the drivers, it would seem better to me to just
> change them in a way that they don't look at the value if the
> corresponding change flag isn't set?

I do have a couple of patches prepped for this, but did want to run few 
tests before sending it out. Now that this is submitted I am not sure what 
to do with that. I can send it as RFC so the idea is clear.

Regards,
Arend


