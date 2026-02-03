Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27B53783DA
	for <brcm80211@lists.linux.dev>; Tue,  3 Feb 2026 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099887; cv=none; b=OambDlhNMvfQLP55F7MiiT/pvJINj52ait3qck9qMh34hAxZbjkF19/rZRHaQV84ULv7Ahq1GSRaiiceCVPXYQVGsowx0SHxAleVAKaTOZQWCY+/Mhwqtvorfp4behFTViOGOA3chjrgkBS4VDHa9sNk/81QZXFCUi1GqgUMeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099887; c=relaxed/simple;
	bh=DnqXyytA3eHd4isuuaVxZ2pCH8gO8AVLcQwRj1P4L+c=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=AFhMwCZsy8Uc8U0gm9ypExrTLdz62B9UBetRxY6EZOuXkisuxcvlMHcPIvrLaU73gBEorKK0VOFPuFFyMl4+lvTrC70UxFefikLfj5eDlNgVUUQbT7hMK3NSzIJtHKbD4N/ABwF/V9Oc+3vT4/wEhxQqmKXFaTW+RrHLKr1rFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WDB12M/y; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WDB12M/y"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso4612874a34.2
        for <brcm80211@lists.linux.dev>; Mon, 02 Feb 2026 22:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770099884; x=1770704684;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fyzv4BpF2csRiKuM0EcuzOyp2n6OQjgXIRPBKETqRE=;
        b=eabp5A5L1hoiTdcI3K3Sz+AIqsN4NSu4TO3bY417MLX/yL3Njftf37zbge3Bl5d+T6
         2neeNpHrITTlJlGfj3bZmJMIOb/Xk4gMbz0SW46LoYuN74zVmOsD1PmvcLV07ATg71ji
         YXzmI10jiMUKSjQqGmTXhcKMRrIe3kC4cSv0gq1fkB8dalveHACF/JAdd9sXw6DEROEN
         jN12ZRDAMC5+iYYd6vwV3UC83lULlCBsTb6cstjEH7c6NPRnZEePMtnhHfjR9wjLjTJn
         Ei3z+010C3E+wKA/XkvBUwXRur7bBhXOl6LS1jPcy6VPbGTR1qvB2rdJMkiqGh7Tv2w5
         YVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1F+cIdoMJ3+hL5XvoY6SgywQzEfRyXeWw+hh/HzliYlCBTwSt8xVqqIVYNWxynzlv7sbhzZS4h/I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi0I1yLKuFXir8WlUI43lWLeqg1yF/2OAcoDtaiC87+0DaHrVL
	FZ3w6JMnp9gNajBo35EcqyQJly+tbpZxjDnB2QO94ALH7O83kO39b6IitqcmJ3f5RsEVs7BOhzk
	KzShMsqp9ab9Id6Y9PbnQFLm87W6SCDtI1nbQtUvm9i74pt/0zmpff10qzMfSK5I1z6qLvlnUJN
	itlRazTEzhZGfrbtJbvBLW2K+TzF34Vwhv8oHrak/BiwWZNmgYUFCZKZwluEpWQs+nU9Q8wQNFm
	raNVsGD6YU57gm+NydliA==
X-Gm-Gg: AZuq6aJINYnwYhos2Xz+M4M0Z6LmqXc5UoHu/pExRqj8mEjPMgBuV2jORKOTghxEIMz
	zFkbv6xxti+g2qAYoAVpJVlr7sSW8hfPj7Z9mg4/YnLtHG7L03gEq2Q9AG5u1QQa+5t5bpVJ+pK
	VluLs3hcXaoDcZq147AsRxw476MfacERJLni0kiDdlmDgnjRiNRVu6GEECm0LMPtlrHV0IXR5T1
	q6UhgqsagXGDxubT2WjIrkfMFB/vS11dAxD+KnbK1meMPwjw9QDcVD9d7OdDx6tpEFZvkGpTm7t
	Ej/+nq3kTV9l7MSI5WcTUz4zN5wXu0t0qIZqWVlpSHlUaXFs/iO86B/Hg2l03RSVvH18lgeyQ8T
	5+P75uwbiQFzljRhoHoWPMm8Up/a3BKaRZxmnIx6dr1AOFYvr8uARiCIF5P5DL4mtAdz8cWXjWv
	lERNYpDhsP5k9VvMw/LyfHAqyxt1Ah+NYxWFvRuPmKx/8OYQnfMyw=
X-Received: by 2002:a05:6830:4910:b0:7cf:da97:57d5 with SMTP id 46e09a7af769-7d1a536a507mr7960213a34.34.1770099884338;
        Mon, 02 Feb 2026 22:24:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7d18c7cf254sm3000620a34.8.2026.02.02.22.24.43
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:24:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b83c3dd2092so545861666b.1
        for <brcm80211@lists.linux.dev>; Mon, 02 Feb 2026 22:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770099882; x=1770704682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Fyzv4BpF2csRiKuM0EcuzOyp2n6OQjgXIRPBKETqRE=;
        b=WDB12M/yWqpKaGc5mswwfoQYoLlV+SAfkxI3b0qw41xaPSaVZf5oLxo/b4pfOmA8jc
         5v6I0qTdh/4krakdD3+XBb9ypRrOfd4gKlVzbpfPdJ7ULCnvNCbKuQ5ON65G+EBhT+dx
         8q8SDqEM6ZLHjRgUbwJnmfAnedb3XQE52hweI=
X-Forwarded-Encrypted: i=1; AJvYcCVZu4bcuUGEKEUH9Mdu17mTGmHsPuiU2ISm00nJgN2wiBAApbb4yeECTXtuuzDJSQXLv8C/DACHzTo=@lists.linux.dev
X-Received: by 2002:a17:907:6eac:b0:b88:64e9:899d with SMTP id a640c23a62f3a-b8dff653203mr854870866b.34.1770099882519;
        Mon, 02 Feb 2026 22:24:42 -0800 (PST)
X-Received: by 2002:a17:907:6eac:b0:b88:64e9:899d with SMTP id a640c23a62f3a-b8dff653203mr854869566b.34.1770099882103;
        Mon, 02 Feb 2026 22:24:42 -0800 (PST)
Received: from [192.168.178.58] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d15sm8546954a12.19.2026.02.02.22.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:24:41 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
Date: Tue, 03 Feb 2026 07:24:40 +0100
Message-ID: <19c222cb040.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <19c1f9f9108.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <CGME20251231143556eucas1p141b278048039730d03edf85c6f3e5350@eucas1p1.samsung.com>
 <20251231143544.4158840-1-m.szyprowski@samsung.com>
 <74e3bb49-ebbe-4692-b278-c04f2a30bf96@broadcom.com>
 <062fde49-7438-4001-a06e-50175547b54c@samsung.com>
 <19c1f9f9108.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.56.0 (build: 105600589)
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential kernel oops when probe fails
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 2 februari 2026 19:31:17 schreef Arend van Spriel 
<arend.vanspriel@broadcom.com>:

> Op 15 januari 2026 00:16:31 schreef Marek Szyprowski 
> <m.szyprowski@samsung.com>:
>
>> On 14.01.2026 14:45, Arend van Spriel wrote:
>>> On 12/31/2025 3:35 PM, Marek Szyprowski wrote:
>>>> When probe of the sdio brcmfmac device fails for some reasons (i.e.
>>>> missing firmware), the sdiodev->bus is set to error instead of NULL,
>>>> thus
>>>> the cleanup later in brcmf_sdio_remove() tries to free resources via
>>>> invalid bus pointer. Fix this.
>>>
>>> Hi Marek,
>>>
>>> Thanks for the fix. Please consider my suggestion below...
>>>
>>>> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable
>>>> support")
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> ---
>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git
>>>> a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>>> index 6a3f187320fc..6615748fa5bb 100644
>>>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
>>>> @@ -954,6 +954,7 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev
>>>> *sdiodev)
>>>
>>> Maybe use a local variable bus and assign it only on success:
>>>
>>>> bus = brcmf_sdio_probe(sdiodev);
>>>> if (IS_ERR(bus)) {
>>>>   ret = PTR_ERR(bus);
>>>>   goto out;
>>>> }
>>>> +    sdiodev->bus = bus;
>>>> brcmf_sdiod_host_fixup(sdiodev->func2->card->host);
>> Well, that would look much better, but sdiodev->bus is also assigned
>> inside brcmf_sdio_probe() and I didn't check if this is required by the
>> functions called there or not. Maybe brcmf_sdio_probe() should simply
>> return error code to make things easier to track?

Correcting some typos here...

>>
> Sorry for the late response. Indeed the bus instance is allocated and 
> assigned to sdiodev

...in brcmf_sdio_probe.

> So that is

*NOT*

> something the caller needs to repeat. So changing the return type of 
> brcmf_sdio_probe() makes sense. The only thing that should be taken care of 
> in the failure path of brcmf_sdio_probe() is to set sdiodev->bus to NULL 
> after calling brcmf_sdio_remove().

Regards,
Arend


