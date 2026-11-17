Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944662;
	b=xTHWut/n6MMzxv+zjhyVskgl8SW+YJP/txt/eN3ELmZtVZJ5JURPD7uT2cDO7jYqJCrY
	 gqTFrk8DMWBxXk4c5isQqWIaXZHI1PTz9Q8k303Aeh3FSrIb5VM8HnReS7K9slzhJumu/
	 htCZTWoAE4VzD4ULgAiQmBA01mhFp/IkKxwJeVxl41Y2To1K2/vWjGmmCbQcHpkqExvHx
	 R+/p1dSKLHP8BvncNOVg0gt6Rth6w0gPp2WcUIlH5uiAsMrkFwCQzmQr3tU2AiD+FcxnX
	 R159LX4otueLvNBiRHDx7bILPcqa68GX9fFPXL/+BTtlNKHZuzTSWAk4X4Skn+eXUAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944662;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
	b=ySbQ6HwrADOcrn+wNWEpkd4AQVDxMCYswGn1eQW0VU7Pzbjfe8pDn9WyrE+dl1fxSS3+
	 bw/hKd0xaQnKvRDfYgWboQ7IC8Sc+TIq/H0eW4s8OdT510oY8rPMJ0JejOX6YM1XucQjD
	 AdYFPOigOEo8JtlPwQpmpz5lHaoiOYgGgxYTIFDoJmrtmWFA4/InFw9WDKRs25VPh8fYn
	 /3C4mC1GQmyD0PLi98FGFCHfhJfkoRxKjRKbqF0hcFFuMXtoK/WBL+mMlfTmFHzC/mc/k
	 A01VgXAooT4U8mAaoErwss1/wvjeIBfNd5RZg0RCgrTpjWuCJNKk/B4QRJEPWEEKQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W0t0V0uG;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE98606A33F
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 19:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE98606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=W0t0V0uG
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso199827a12.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 11:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944662; x=1795549462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=rFsel7GcXDzhNJpTbhe70q+eoHNnbpQPH0pbHqndarTsPWAchZZmz7NruLFA+7xwSR
         fWf8Bk2/UZ2SQhjryxdmE0ZfUrxQxxlsok1cER01JhViBS1wZNhwqSviEVMlYWD2UYN6
         JJ+3Vk7YFw1mSSS0+qOuYrFQak6T5tfvvQE9fLkyt+XILisilyA1i2QSQ1KQ6mwvld1t
         V/aMiCWUQBgdQeYqD+xz7VC5oeJZyLy8A/7yWsOmXO/l41QgHJtQ31+hlLrGODOJypJr
         oT1dXVxUROfhdYVeeVsB11W4XAA+kmmTxEcjWdy0AAgPULowJxtr4b+b7SxbQEftyikr
         mVFw==
X-Forwarded-Encrypted: i=1; AL+hErFwwrqiAytfAT6ShbK6op643abm9qFDlColOxvwzRv0f+ub1sRhhQWNeSwiKeMgDzGEJEpFXGHuSzE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cJmh7LF7pMBoYTc+hxJKhqbeHean4OFqPSQPqx/zgxx9Aqqda
	WHofw7pXL3kHE258A6D1m29GZZXJ0WMKNLQTXTr/tLtGfsOn1v+9tw51wSqqpCmjc084UinJkOw
	TIyVbQbMbcbgP+CMK9moplrvWsW6HbfkG3kQ1zoo64FpZb5jm4PZo8XjbfYKlovdy1Mda4o8sD/
	EQ03fU7pFCAeW/7rDd/wvllR6ANXao8hfH/G/F/6Pwsq267VeHqiZR2Alr4i3JoTZqNBSLXpnt/
	8YBRDBc9yXGIz691R4=
X-Gm-Gg: AZFdTZcHThkdl4mS3apxj7oDa8ZGCpnrA9mYs5ZKXNVSMR6/owW+wDbS6nfZHwKuEXA
	ztuRqEgomR4gEssARosDZ706eii6NubB2LH85W9y7WcACvF0yAI4wG2jODq5MP79f2wqQjYtIXJ
	uf1m4XiRXZq3SMwHOT0lUWxssGK7kEIAVR+HXgCRhvflcVGgYtspBel2aUOzSvZ+FhVxpqke6Gq
	begAnV9PHUuCnmLCWczbJcm7scqrtDlpxgXIJj4hRwAJWi62e8oop8lb801iFOxUk0fSFqw4F0G
	4yAJ6jDrH/pC6T4ZFHPHEGVkGqnZdZObLpBgfQOQYDqkPSvgisebFwrAdWx3RBeTiVsZIxrCEgT
	OLgdXQanmWxjlWYeW015xwBQ8kihKIOlNwgRuzPYi6vmlCyzk1JK4UCpkd8fEXHlUxUoqi+VD5x
	0VOk1VNmz83eOqPv2ouKiVhwWtremX2OnmnAXVFXk=
X-Received: by 2002:a17:90a:d886:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b3d0764a7fmr446966a91.26.1794944661463;
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1cc7affsm110716a91.4.2026.11.17.11.44.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4d34d6082fso6383266b.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794944659; x=1795549459; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm768rj95XSqhVFyKaRCqQbLbjDKoGVyyfyto0z4Upw=;
        b=W0t0V0uGf5VSFnEuwHBrZH50tRVaecIS9hdG3/fsqXUaRcYmUldbnnRPgbjZrv+Orb
         /uCNwNojfWqpQeUSEyD/mqzG0uBh8gqXaRjwiexwX1EVR/DA461KMGTRB1n4KGvxbhwI
         JPWp+B6Uimi+5karyQXWeOx5tVtd0KuQS+E2s=
X-Forwarded-Encrypted: i=1; AL+hErGj51MvWmYScYaLtBvIuM5p+1bKZpBuWrwDLSb1yD/yb4vR6NpPKauiiUjMIhKqmZbIzX/3bTQN1Wo=@lists.linux.dev
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29023666b.15.1794944659439;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
X-Received: by 2002:a17:907:d407:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c510e15c00cmr29020766b.15.1794944659038;
        Tue, 17 Nov 2026 11:44:19 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca0d085sm15771766b.13.2026.11.17.11.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:44:18 -0800 (PST)
Message-ID: <7d5eabc5-5876-4ee7-8a82-0bd3a47c733a@broadcom.com>
Date: Tue, 17 Nov 2026 20:44:18 +0100
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host
 on Apple chips
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Andre Eikmeyer <dev@deq.rocks>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Yossef Osman <Yossef.Osman@proton.me>
References: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
 <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 17/11/2026 18:49, Aditya Garg wrote:
> 
> 
>> On 17 Nov 2026, at 2:07 AM, Arend van Spriel <arend.vanspriel@broadcom.com> wrote:
>>
>> ﻿On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
>>> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
>>> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
>>> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
>>> then pass the PSK to the driver and leave the AP side of the 4-way
>>> handshake to the firmware. On the BCM4364 that handshake never
>>> completes.
>>>
>>> [...]
>>>
>>> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
>>> runs the handshake.
>>
>> [...]
>>
>>> ---
>>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>>> 1 file changed, 14 insertions(+)
>>
>>> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>>>                     BIT(BRCMF_FEAT_WOWL_GTK);
>>>         }
>>>     }
>>> +    /* The Apple firmware for these chips lists "idauth", but in AP mode
>>> +     * its authenticator never completes the 4-way handshake and the
>>> +     * station is dropped after about 8 s. Leave the handshake to the host.
>>> +     */
>>> +    switch (drvr->bus_if->chip) {
>>> +    case BRCM_CC_4355_CHIP_ID:
>>> +    case BRCM_CC_4364_CHIP_ID:
>>> +    case BRCM_CC_4377_CHIP_ID:
>>> +        ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>>     /* MBSS does not work for all chips */
>>>     switch (drvr->bus_if->chip) {
>>
>> The commit message and the test report only cover BCM4364 and BCM4377,
>> but the code also clears FWAUTH for BCM4355. Where does that come from?
>> Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
>> or justify it.
> 
> 4355 is also a Mac specific chip found in MacBookAir8,1 and 8,2. I'm actually surprised you forgot about that especially when there was a whole issue when Cypress named their chip firmware wrongly as 4355.

Getting older and a bit senile I guess :-p Still it pops up here in the 
patch without mentioning it in the commit message so my question still 
stands. Also are there any logs made while debugging this issue? Having 
firmware console logging enabled might be useful to get a clue what is 
holding the firmware from completing the handshake.

Regards,
Arend
