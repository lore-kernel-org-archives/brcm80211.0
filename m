Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8242248A3
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774696103; cv=none; b=nQJG7SaUoQVHoZVXw+V9YnyOanVZbEcwVC+SkNgOkuZ8SGl8U89OMMnVM1Hvl3v8tJk3BNWsyPLZoimXwzuhbTMC21VqWcbC+jFMqaZ/JknZJaLHFMIBtd7DVNNhuKkukj0JwysQnKcPmoKSDPV522A3wsB/GWvQz4KbjP92XVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774696103; c=relaxed/simple;
	bh=Jc86y6vosjJg43sZQ6yoIOzTYidLgFRcyXlsjXkBL0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpD666PH6hqNIHkz451Gdha5o6JpORlFiIXKkagpCTsumX71MgFEG0PJFHXxDLQvohNWrrOGab1sBR2gPkknkRVDe2kyl3Wo2xyVy4/h5Vy+Re9Eyk7HvXkuDWeJiYuY1yr3Fhv/KPurE5jvqQnruSAzW4OCKVaBBCQ/0ReOXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RcIebs2Z; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RcIebs2Z"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-415e568a7ecso1126117fac.0
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 04:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774696101; x=1775300901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BLF/+iTQ3iATILhR5zIsR9RzOGZ7FQ8p8aLXTNannDE=;
        b=Wvkh8pZNDvUWV5B2yrccsReX6R1dku5wpcpScy6dt+b9EZCARFhLXOnT9FR/is4t9A
         7MwfkIFpSE+QETi2lzvB5z+Hv2goO6FM4NykAg4/hSpE31+YOqg2cfF6dF7RvaXcyYml
         8u4/lnqUMZxqa3i4MWwsYhu8jTn/Ht8S5cSQYd8EPJZfBhNr8uSvPDrhmg/xPDjxRGpG
         lZAMtvSZ7q4i4/7D+cl/ETy9zVSuztdOVK7gpKCZrvN2jyxT3Y4mBIgGJH2PxHjP6LKA
         wLA8tJeFck7FYjz43Qrdlfyd7BG6/vsBICMPsoDqgFQKndAcFxJRBl0MmvvGV2wywE7Y
         wC1w==
X-Forwarded-Encrypted: i=1; AJvYcCUY5DmaG6/3dOZAkXwVQEM9TPtF9LLV54hfL3I7D/TuRRNyjsHIM8HNAuzEeQU1NY+xuiMTRwH45cE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6MbKQl/cGWE/pclhksEsxcvBgQ3z5Fs0KBqinpLw4LZRlfx5u
	L1JKicdXbXJMyUN74zyczP4xwig0P3XLOvhyzlxnxrEeiLvCJ+eJ3aZkPZvTEM/d8wxvHLGta3D
	bTwgYZL+f4vMittKgKWU4ldqM7MDLFzQMiioLiY/jQo0gpjqWmlu7gCPM2RZ82YOpVYwwfaEAvh
	r45PGVBx8Nl1aJOfg7TkqYMcvyv5lDn8D92AQ4ZBjy6/1+/9rn5Jwo286KbOSVSrPLPB6pPS7OW
	Fr/hx2m1NfykbUzi0U=
X-Gm-Gg: ATEYQzwminM+9LG3M/AoM4lF6N22vimxTdxswG+k863UW0mJzJRwFNU35T/Gya5CSHz
	Xj3pLRIv+trGpujSBso6Wwi+590WxXcSpj4edXtxux5P7xrNyYYLsMs16t/OnsuNtHscgPmAsPg
	pFdk76ap9tM8izHuuYpA7h5Hf8yIkTRLtdIGIL+jcfn+N0EaWhfH1RNiQY1lMKTt3skupsRo10E
	ofCkBE9I+M+chcE1CIMLp9tOTeU+vq0AVYzQ7OKZi/byUDWnJJk769AHLl2MoMrbFYPAJnfwqPD
	/icxNQciK+px5t2HfkrmS1tK0+wfossXcqLpABWiS1qRf7MeXJnm39lzQ+gevIV70yOiLDcM1Hh
	V1pLuIMat/koSlRhGUGeAEjEKJBDUs85hKxI4+LP/SfTPcJb3XANDG1EdzVf6I155E9AvW0wmgZ
	P4VZvYyx/Ahr9NCQSQpeHNxfGWP5vGbhphTeZG3JykUrgNz33jGbiBfujaCjzo
X-Received: by 2002:a05:6870:b99:b0:417:382f:c242 with SMTP id 586e51a60fabf-41cec110cb6mr2836939fac.18.1774696100751;
        Sat, 28 Mar 2026 04:08:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-41d04d50e54sm338161fac.10.2026.03.28.04.08.19
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:08:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b941d4b7f2cso384511566b.1
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774696098; x=1775300898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLF/+iTQ3iATILhR5zIsR9RzOGZ7FQ8p8aLXTNannDE=;
        b=RcIebs2Zn3qIRMC2nQIpKs2FV2skBXYUJNeMHNPeHBjUliSoqpepB/N3+BSctW95Wz
         IeQFZePt7tryGS0/1Ogncn88wNHAqXdDi16zYXMXlDnKPDVA1kZ1mGgYAFE6RjPPKW+A
         7aW7DL6TS9cSQGWn9CnSABWbDdBspid4UQOFk=
X-Forwarded-Encrypted: i=1; AJvYcCXm5hdT4GEHcaONg8/z9nY1tyIyZn3R+qgqD+ZAxcLSbRZqj9MDLSrdZYMGyUQL+Pw+yzudlyRnKd8=@lists.linux.dev
X-Received: by 2002:a17:907:1b17:b0:b93:9ac0:7913 with SMTP id a640c23a62f3a-b9b50569823mr422289866b.35.1774696098001;
        Sat, 28 Mar 2026 04:08:18 -0700 (PDT)
X-Received: by 2002:a17:907:1b17:b0:b93:9ac0:7913 with SMTP id a640c23a62f3a-b9b50569823mr422287266b.35.1774696097499;
        Sat, 28 Mar 2026 04:08:17 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e438asm64253066b.47.2026.03.28.04.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:08:17 -0700 (PDT)
Message-ID: <fe3859ec-c799-4b05-bbb9-897765269252@broadcom.com>
Date: Sat, 28 Mar 2026 12:08:18 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: brcmsmac: Fix dma_free_coherent() size
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>,
 Simon Horman <horms@kernel.org>, "John W. Linville"
 <linville@tuxdriver.com>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20260218130741.46566-3-fourier.thomas@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20260218130741.46566-3-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/02/2026 14:07, Thomas Fourier wrote:
> dma_alloc_consistent() may change the size to align it. The new size is
> saved in alloced.
> 
> Change the free size to match the allocation size.
> 
> Fixes: 5b435de0d786 ("net: wireless: add brcm80211 drivers")
> Cc: <stable@vger.kernel.org>

Looks good to me.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
