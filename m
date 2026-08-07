Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAE37BE7F
	for <brcm80211@lists.linux.dev>; Fri,  7 Aug 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121532; cv=none; b=rxbbQqkmx9wEZ5GRENi1Gkcyn8um/M4f7QZUnCcfXS0k1vW4p30Y4JGClhQTaawv7HAXBauTC7NwTeCUtaxTIWe8Bt6xXTqg2YM9mBid7wSW50/19tYlakcj/084IEbY7cRgfppE/SCU3ytKdJENafFI8xAJn0QpELtcHzOm88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121532; c=relaxed/simple;
	bh=O58BTvrNM2aC7RLe/NA9M4KfX96TgIfxhat39lMlpy0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mLFh9UIcXX9PZLg8VuJWc/cvUVPneV2Ssbn36RRm9fEJ2nux3+k/tDHKimfyyeTotCK8fLhoUc4s5a7BGtFUXJjNFXxCHi++TVzHlaOSY0GUCUo37k2LoIGrocS6bdQCYU2ESaYZn2So6uQ5liKUJMZR+xiq0Z6o86ARZXKZpI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BriHKj3A; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BriHKj3A"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso2473333a91.1
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 09:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121530; x=1786726330;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK4XYhySCSAmfEvjmTkEI+hN3CX6qZ07+OcZw718arQ=;
        b=AkKgd0tbb1eoxsAFJRkq8rhNP4DPlHp0WMuI88hq+apVAekNpjHAHIYXIXNRGHjXJH
         gqYnPdLopxydy0CZgXaASA1yHzRpzCbDHniSF9reB30+Y6uouw113IWBPMsVDfuq7EJT
         9XKtXhy9FZqhFefv47ifMCNZYoaDHrjdYJof67EkXE7/qiIrS/niLVH2CtkIs1xmYYTV
         TU9CueJ5lz6HrJoC18pRX+nBEun7F/Bpol14PoeBPmPl39RhMe4d4yOlTQH7vJI4IO4j
         /lfe23IWsf2RhvM3boiBdmB2CKVlhuB+OqRGKHAdrrcHYCjksez1LNJUI7ew505REP9G
         3KTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Vdpya6rBfr3zA6zVS0xd2v8hpDdoiOEBzAzAKZmnkxL0wtKnAFqH6VV3smAi8Q/viAXMEh1VjW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3P1FOW8SWQtx9+UZCWYnkvEA5ZgSJI7EgO750hwJ40vymyEQz
	ykUDwAAI1apV2RlFXDkfy2f5J2R6J74LizJjY4zAnNz62+qIHkAXVT5Ec4AygyAdYZM86uqzRfz
	xse0qQNEqvPaRA2Zz4ezKcIIRizRC/wEyWsOKhcNfR535uAKgEMe0RkX2JYTvHz9395f0V72GBh
	0tWMbdhUF7hfyc17dgcSYnfsUA+XnKNO+fzBj091sLLOOnY9eTVZvnnlmBFN7nzbpUsiTPvIvtA
	Z8/+y6VWwSlSpN8muUX/w==
X-Gm-Gg: AR+sD1180r1DqENACDSTgHd2uRQ9VVNAPpk8HpwmTjGXVuJtrJlol/wqESwzm5fqrgf
	LIU5HZoiEjLvvzM0VblqkYiFG9JVgm7L9kSgkbhNcIhgV10XNGo2mItl6o7maGZTw0+4f9minhL
	aG8JXxWvWob9PLvBpL8Dt08ySzJ20kSA0QBP6C9bsupZrl5riYnhvox6oX8CtU7btzdOGVK9Poh
	b0XlDIhSzqVIG5GSSg4f5tbDGNUBRx5/Z4m41iFmVX/VHVV/SbQsHv5FXIm69Bk6wvov1sCoMrr
	Qv7JBKanDR2mxxHO51H5gqTa3eBrQyhFXHdk0iC1JjN/SyYWm8riHTJ2frNbKQN8b3TkNJoX4ZT
	xwVo1y4X58rHgAjwtEIagks/YIJLvEJkDsLertBieXWsI7Zr7cHk3yQH/xSUo6Ds3Yn6skVXDd6
	t3Xh5PHCBAa7Uclhb6C8Ov3CNT+Uc5hJYkTUTKR3k=
X-Received: by 2002:a17:90b:3a84:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-392845e20bdmr31919a91.2.1786121530437;
        Fri, 07 Aug 2026 09:52:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3925fc37dfasm1095094a91.1.2026.08.07.09.52.09
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 09:52:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so36272965ad.1
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786121528; x=1786726328; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK4XYhySCSAmfEvjmTkEI+hN3CX6qZ07+OcZw718arQ=;
        b=BriHKj3Aj7y3Zh/1w25KR7lsPJ7eXMKt/f6ICtfOh8Tgipk6oOfFKNG72Yz/BbsgiW
         ElAVUYgcXSXOF63lI7BFImn8FdeQTQv8W8m+OkdSNf6B4hUirhFPSTVgBbmSQiyJQphC
         bg+78oqMR2VQP9/HTOThaklRYuEzBNj4bi+l4=
X-Forwarded-Encrypted: i=1; AHgh+Rp0luoPdNkjRGIuDg9qFi+6FbKGndZSR2TElp7lkf0mNlzoxR8Z0kjceGw94zyaT1zKjsd7MC/FbjQ=@lists.linux.dev
X-Received: by 2002:a17:903:2289:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d2b2e9258fmr175725ad.13.1786121528504;
        Fri, 07 Aug 2026 09:52:08 -0700 (PDT)
X-Received: by 2002:a17:903:2289:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d2b2e9258fmr175115ad.13.1786121528066;
        Fri, 07 Aug 2026 09:52:08 -0700 (PDT)
Received: from [10.229.40.14] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm10580276eec.28.2026.08.07.09.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 09:52:07 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Fri, 07 Aug 2026 18:52:03 +0200
Message-ID: <19fdd238f38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20260807163418.487508-1-bogdan.nicolae@gmail.com>
References: <20260807163418.487508-1-bogdan.nicolae@gmail.com>
User-Agent: AquaMail/2.6.0 (build: 200600043)
Subject: Re: [PATCH v6] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 7 augustus 2026 18:37:48 schreef Bogdan Nicolae <bogdan.nicolae@gmail.com>:

> Zero out auth_status on initialization. Otherwise, garbage will
> leak from the stack to the firmware (when ssid is less than 32 bytes
> and/or when params->pmkid is set). Then, pass the params->pmkid to the
> firmware (without it, the firmware caches a garbage PMKID on successful
> authentication and denies a subsequent association request that includes
> the PMKID).
>
> Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE 
> authentication in station mode")
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Hi Bogdan,

Looks good so my Acked-by: still stands. Thanks for going with the flow.

Regards,
Arend

> ---
> v6: Fixed diff line number
> v5: Fixed line length > 80 chars
> v4: Fixed indentation
> v3: Added Fixes, Cc: stable, and Acked-by tags
> v2: Split into a separate patch
>
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)



