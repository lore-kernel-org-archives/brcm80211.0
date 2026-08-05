Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAB9477991
	for <brcm80211@lists.linux.dev>; Wed,  5 Aug 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942998; cv=none; b=I2axMoIjcr1q94xmp+abl+kZiibKYTe78TNGl/ZMzqD69iu8LOzwrKNScvL4v0GiDt26BM6EL5vHvZsXEeNEQk0X2j3hMPPA3w4Gj9d8hNQk9sn29l0Xz+JcQi608N/c/L/56Z7S/KJMA6MiS5qEdtaGqdJlRSerMr6EzgLBPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942998; c=relaxed/simple;
	bh=Zm5dvm6C/uBIvS3P/ulTagzCr2lXpSwhgEkQHY5C7/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQxsxrm7oenYOmoKhtT1iBfWkRbu0tZLR9hzdr8NPHT/40dYALGnQD/3p3EnF6ta07DkOlxuSf4L4yuaykv8kdDjJV9QbTJPJnAugTHE7QnCzgQBjiYWbJuBRfxTFC0EGq3jytqGL/7Sxw7AXqZqNM62UDjM30sHwALolWJtGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eoVSxvuf; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eoVSxvuf"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-82011c59e66so21884317b3.0
        for <brcm80211@lists.linux.dev>; Wed, 05 Aug 2026 08:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942996; x=1786547796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JJ1jC68Ns2mHBB9nXhjFPTzovfe3N8pJMz4GD5FJ1vo=;
        b=f0gLziINHA5OnJSXCeYtaYdMHvGuum2Bhz2Y0kj2bc4Y4EKYAkxaq6p7dnqMwY1q6N
         1mvlLpsGKaCxFHVf6MZqsj4ca+ClRHOdCFuir2yd1xa491hu9E3XgkBoMRWYMkb9sgct
         YF2Y37yc1Cfr8RtdX/XRRTzVwp2JDFJxVZ8UcB/EDnPgZedX+jM207vnkZyswLQXLP5Y
         3qCkwV1R3lWbvFlUELlZDPaAq7BgmAoDvjBiq5CEsf3/RjKCignFB+4umDzg7BHyylem
         o2IIH2pRtszsk7rDOhr+p2L1zX0EWBYGuQwU1lfb31XJr32XuaO4WFGM46H0CdbCVaTi
         SfNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtaB0DCFGhmpwvYBlVtKATFBoPF0os5ZCQ01YMIVdbHlxZDbicSTK3AnvblZFsSVjrcyQ2GOLsWik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8IdkVO2Xvk1SCGtj3v6gS7Tw1oFu2XsyQ5gOkGOCSi7XypmZf
	KggzlPYVhU3R66LLVcZ3EVbbHk3AWQ/pRfdNz7NkGtgE9oC5t72FHS9NAszRb6v3y9y2ZpRzoMQ
	QbIRUqn/E9Ik6kqN0LwRYvnGHeeRPzUT/5ViIFMMwbRU/Ay0tB98xvurLhFP1lXZN8VLOQDPho5
	aXgKxNbDbFD9+9R02uj2EZqkPETsfb1hv+OEa8urJfwLbD5QWYu1qLgXvoOMfEwhqzPkK/yh8Sp
	2fvhKDcwsTn2XGBJ6QNhg==
X-Gm-Gg: AR+sD13MfqYcYslI5/H53OJJnkCo010aQDhEWJN11kfejWlCYUDtlufqkpDsei2aYuF
	9q6ry5Yb5JlFsKac4j+Dw5bYO0ScX7fcn4YOTWqZXsCw9qbjxiIaJy/MVplYdQ1NOFbi1UmDLtB
	gIehv9eSie/Q+fsB60hC47c6feZNiIrAZt2xASMeCN2akrcBhSb0oejY43IhgisCqmumUfNU71f
	ZEOpoEyzbQs41DdmagyOpyGvDp6Rx8zohS0DzDn4Ii4LURmLXAuGJqAZN+5nz8GJ50BMe8il+lK
	Rzt3dgHPtvrV+O5nCUDWQgCgw3yYIZiyY2g8crkJ6O86LQdwi4hOYgtApzAQ/igMEmlPg8PQiPP
	Qo6vx3ruDajUJulGSZJFkaoBsUOMHIUIPiIBSFrf+pIviRjvxj+0EYuEg/s/rf4QqwzMxqV/lWi
	t8nldBln7fcKC2c5KgkQAzXWc4TJ7st0+Fp55z4jY=
X-Received: by 2002:a05:690c:c8c:b0:7d0:79f:339f with SMTP id 00721157ae682-82022504c69mr44645937b3.34.1785942995466;
        Wed, 05 Aug 2026 08:16:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-8201a90d7b4sm705917b3.25.2026.08.05.08.16.34
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:16:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15e555a164so149182066b.1
        for <brcm80211@lists.linux.dev>; Wed, 05 Aug 2026 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785942994; x=1786547794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJ1jC68Ns2mHBB9nXhjFPTzovfe3N8pJMz4GD5FJ1vo=;
        b=eoVSxvuf8JGKcl8Izy1LPbrnMzqGqrI1xC7XqPIHmNx/2yVGQglJZB9D6XHapaUEX3
         uCYoSjSIE4lCDfPyftM/PQlygYZp6hfFEcpvO+2Bwn2DRwkHMO+VY+47hQlymZA/1d6Q
         lOri0hGt7Qlbr8IyqdkzSRY5gvqnFkznLB4Ak=
X-Forwarded-Encrypted: i=1; AHgh+RrQ5OpjL5jbH3gISSiuGA89EooJ5y0/asnrUESBa9vaRm1MUsLzJE8iPXFA9mzppS3w7OE0GeMZiCA=@lists.linux.dev
X-Received: by 2002:a17:907:9410:b0:c12:525b:4e7d with SMTP id a640c23a62f3a-c203856aaf6mr433649366b.15.1785942993734;
        Wed, 05 Aug 2026 08:16:33 -0700 (PDT)
X-Received: by 2002:a17:907:9410:b0:c12:525b:4e7d with SMTP id a640c23a62f3a-c203856aaf6mr433642666b.15.1785942993107;
        Wed, 05 Aug 2026 08:16:33 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20363e7638sm134090366b.30.2026.08.05.08.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:16:32 -0700 (PDT)
Message-ID: <2ca5662a-4946-4b38-bd1d-adc27f86aa16@broadcom.com>
Date: Wed, 5 Aug 2026 17:16:33 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Add support for BCM4361
 PCIe chipset
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260804-broadcom-staging-v2-1-cebdc69e938c@gmail.com>
 <2dc55d93-544f-47ec-b349-c206f5414f22@broadcom.com>
 <15ce55e2-c4cc-4579-811f-4c13e19bc6e5@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <15ce55e2-c4cc-4579-811f-4c13e19bc6e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 05/08/2026 15:56, Markuss Broks wrote:
> Hi Arend,
> 
> On 8/5/26 8:46 AM, Arend van Spriel wrote:
>> On 04/08/2026 16:07, Markuss Broks via B4 Relay wrote:
>>> From: Markuss Broks <markuss.broks@gmail.com>
>>>
>>> Those are the required changes for the BCM4361 PCIe chipset support.
>>
>> Hi Markuss,
>>
>> That is a brief commit message. Maybe you can provide a bit of context 
>> for this patch answering these questions: Are you using this device in 
>> some project? What platform are you using (if any)? What works and 
>> what does not?
> I was just looking at similar device additions in brcmfmac, and noticed 
> they didn't have much of a description, so I decided not to add much 
> either. Should I add some general info about the BCM4361 into the commit 
> message?
> 
> BCM4361 is used on the Samsung Galaxy S9 device (samsung-starlte), based 
> on Exynos9810. There it's connected via PCIe link. Not sure if perhaps 
> there's SDIO or USB or other variants of this chipset. Everything 
> "basic" seems to work, seems to connect to both 2.4GHz and 5GHz 
> networks, download speed looks good. Haven't tried station mode, but I'm 
> not sure what's the proper way to set it up anyway.

Mentioning the platform you tested these patches on is sufficient. So 
when you say "connect to both 2.4GHz and 5GHz networks" I somehow 
suspect you already covered station mode.
  >>
>>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>>> ---
>>> Changes in v2:
>>> - EDITME: describe what is new in this series revision.
>>> - EDITME: use bulletpoints and terse descriptions.
>>
>> This really does not look very useful. Those EDITME: are for you! As the
>> actual patch did not change you can probably say:
>>   - fix subject format indicating wifi subsystem and wireless-next repo.
> 
> Oh, sorry, I did not notice that b4 puts the changelog there if it's not 
> in the cover letter. It's been a while since I last submitted 
> something :) I will add the changelog there for v2 and v3 once I submit 
> a v3.

Sure. No problem.

>>
>>> - Link to v1: https://patch.msgid.link/20260803-broadcom-staging- 
>>> v1-1-f6f77e55b72e@gmail.com
>>> ---
>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c       | 3 +++
>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c       | 3 +++
>>> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 2 ++
>>> 3 files changed, 8 insertions(+)
>>
>> [...]
>>
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c 
>>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>>> index 55f4d7b970f2..914ae72a7b74 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
>>> @@ -59,6 +59,7 @@ BRCMF_FW_CLM_DEF(43570, "brcmfmac43570-pcie");
>>> BRCMF_FW_DEF(4358, "brcmfmac4358-pcie");
>>> BRCMF_FW_DEF(4359, "brcmfmac4359-pcie");
>>> BRCMF_FW_DEF(4359C, "brcmfmac4359c-pcie");
>>> +BRCMF_FW_CLM_DEF(4361, "brcmfmac4361-pcie");
>>
>> Are you sure the CLM blob is required? Can you test without it being 
>> present in /lib/firmware?
> I have tried without the CLM blob, it says "no clm blob available, 
> device might have limited channels available" but seems to at least 
> somewhat work, I haven't noticed a difference. It's still a good idea to 
> load it probably, right?

Right. I was just curious whether it has a working CLM blob compiled in 
firmware or not.

>>
>>> BRCMF_FW_CLM_DEF(4364B2, "brcmfmac4364b2-pcie");
>>> BRCMF_FW_CLM_DEF(4364B3, "brcmfmac4364b3-pcie");
>>> BRCMF_FW_DEF(4365B, "brcmfmac4365b-pcie");
>>
>> [...]
>>
>>> diff --git a/drivers/net/wireless/broadcom/brcm80211/include/ 
>>> brcm_hw_ids.h b/drivers/net/wireless/broadcom/brcm80211/include/ 
>>> brcm_hw_ids.h
>>> index df3b67ba4db2..b800cbfdece1 100644
>>> --- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
>>> +++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
>>
>> [...]
>>
>>> @@ -86,6 +87,7 @@
>>> #define BRCM_PCIE_43602_2G_DEVICE_ID 0x43bb
>>> #define BRCM_PCIE_43602_5G_DEVICE_ID 0x43bc
>>> #define BRCM_PCIE_43602_RAW_DEVICE_ID 43602
>>> +#define BRCM_PCIE_4361_DEVICE_ID 0x441f
>>
>> Please add:
>> +#define BRCM_PCIE_4361_2G_DEVICE_ID 0x4420
>> +#define BRCM_PCIE_4361_5G_DEVICE_ID 0x4421
> 
> Are those some special variants of the chipset?

Not really. The difference is in the radio frontend. 0x441f is a 
dual-band. The other two have only a single band so the board gets a bit 
cheaper. The device id is programmed in on-chip OTP so firmware knows 
what type of board it is running on.

Regards,
Arend
