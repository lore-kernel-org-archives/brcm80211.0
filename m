Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55D378D92
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785103872; cv=none; b=klyyj3q6JtgtcCjUncnoytNKyeM1VtGT8/De9qPZwBbzMWIfvxJA4nhekl5HNeiigIvQinpCPfS8oplQHGDyi21kdJ1LEe0m05tXFEHIS/F8hoANhBG2Z7U0csMG9krWtYVJ1kdwfQOocYUuaFlG5VVzBYoPiLZcVjIiPpGFFOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785103872; c=relaxed/simple;
	bh=2CIxhBpPAZNB8okkFClso/bOGlpCuZh9vzdfx8hWPZw=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tDVRP5/y97/gATe7mtSPKpdY1KwzO5Q9Kh7ZNe8pYEP7efrSr6oN574laHS/1DoD3cQExMIgRFq9oUkAkWE3d9mjPLOzZWjvuSesbS8tZmyVJFajWGEnRC+lrFCty5lir6embkZfIrqflKqEjzTmYumAq+WwYN56LeNlUvoMysw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HaOYQTp5; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HaOYQTp5"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so617391e0c.1
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 15:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785103869; x=1785708669;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dz7NlMBaqq6fhbUxmafTBTywhLBIEqhclVZzBK73Jd0=;
        b=CuftMQeYrBOHMjxP/Q9a3UA5a056KFs9hNSvx1Nt6L/kIGCR7vyVvQO5X+OfAk+8gF
         5Yfy24swOoiFkcH/XhkGa+XsDpYJXIG+iPRGtWuuN0b4tHMd4u/Z49oSP0azGu3PGEEf
         RsH7sl8KQPm8HgqBRcQeJYZ48/z6yiVTmRctV+Ziwi6RUApcew0dpJPm+4Se4hp020JK
         NG2XnaLJtcZWvQm1SWA5+0FTi4UQ3kJ+AEX8v2mlZTeXVDUKw441O0LrUehbYLKbi8BE
         ibKnrfVQ1N/l8pXV8eHT1u4z4Tt6WJ1xh+z5cC13KiKmMJIfojRvMUEYDEybOVMMAm7/
         cnqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7DhUDrKfjnRuJ3ReeqS0spu+fxljcm/31vsjRqAjhNQnS48cIBYPanCMuEIjBlfCphh/IOvK5QR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZvlhxqAueIIwImLFyn2c00ayS0eXW8RYzOVwiyv/PXjjQLh3/
	KmmBTupcqAzKSSgIC6FTWYRLcvH9P7yPDlPlOchIiYX8wrhy308yei+rt3uxCjbCiha4IDuQBdC
	62s8YdKO/UUUh9rhtnzqPzvInxCkFN3xo8gfaReG+B3NjgN9WfHsNx9AXnpb8kG3zBsvlETUY7o
	xM+/HFB84rEwgakmZx5SbIDDjF8IASBxMdDJ5XJs6uhxaSUy+vHOyLW7w3BE1zdyyNT87M06P/W
	27XNe8KHxdOWTT0oFiT5Q==
X-Gm-Gg: AR+sD13hGupafEsKVtaX9/mXX3JqUdtIFkhQXuN15IuxpclB/UrTugWgiXW6n4x/hol
	oKAwLhFXkSr4WNgT/zIeWGo3+uLW3Siw+LYZksNr/iM0RB/1QiZxqDlkViKg139rUW4yVNoQf96
	Rw1pufImDvdlKyrJDFT4rALTYhn1EAq1B7Go96+PhF+NTKyhYet/YQdpd/nwSeNRIJU6FkoAIaP
	Qn7CLNaVaa5hyZxpEbD77QaJMpy/bfzmdgeOkUs8MoNzSmZ3T9xrPhh78QA1n5cxC8+zFQntLjZ
	upl9gu2WzPP85CPGOV5h3zfemY2+TkJyM8QFRJQ/oLmECLcu3l33MDAbeuR08vIjD6pi48gZlvC
	zfDyEKr3LBRdYoZ8d9I6JeOAIbZpOgTKgS0jiY5m6n6Yux+shyu9Ifi16wmRWsHpQ8LOUnAn9ek
	cJOI8/hOvkwqKkMDE2pr0UrsAKk1tzlbMkp1pdhsw=
X-Received: by 2002:a05:6102:fa8:b0:74a:c575:5fb5 with SMTP id ada2fe7eead31-750406b5cc3mr3375416137.25.1785103869072;
        Sun, 26 Jul 2026 15:11:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97774fa1434sm206172241.6.2026.07.26.15.11.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:11:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-698af52daa4so2066349a12.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785103867; x=1785708667; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dz7NlMBaqq6fhbUxmafTBTywhLBIEqhclVZzBK73Jd0=;
        b=HaOYQTp5915UgXsSh7jkjmHLH1uV+E/dEJj/W5kr2Rx2CtWVaoamkZKoP4TGtZU3Jx
         fprJxtonaSc8aXW14uztx6LWg2tmYEt8Ea7EYK/pWflkr9+udKAizLwzuKo+sRpNQrBf
         GaTbCae0dLwWVHMmV35cguJ49yAGUx76OwW7I=
X-Forwarded-Encrypted: i=1; AHgh+Rr1lr3E4bWW9RlHxDRX7whsjzrfYTWXks45GjMOIyZoVhRroDVP2+gJJhg5r1uHiAXnj7dHY/s734c=@lists.linux.dev
X-Received: by 2002:a05:6402:2383:b0:698:3eda:1197 with SMTP id 4fb4d7f45d1cf-69fc1160c0fmr1962284a12.20.1785103866788;
        Sun, 26 Jul 2026 15:11:06 -0700 (PDT)
X-Received: by 2002:a05:6402:2383:b0:698:3eda:1197 with SMTP id 4fb4d7f45d1cf-69fc1160c0fmr1962276a12.20.1785103866316;
        Sun, 26 Jul 2026 15:11:06 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bd467sm1891417a12.1.2026.07.26.15.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:11:05 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Mon, 27 Jul 2026 00:11:04 +0200
Message-ID: <19fa07b50c0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <ded836f0-d683-4469-bae8-d95bb3e3cb63@oss.qualcomm.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
 <20260726192541.2816743-2-arend.vanspriel@broadcom.com>
 <9b00d432905facbe0f86556eda6c2986df79888d.camel@sipsolutions.net>
 <ded836f0-d683-4469-bae8-d95bb3e3cb63@oss.qualcomm.com>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH -next 01/10] wifi: cfg80211: pre-assign cookie for remain_on_channel, mgmt_tx, probe_peer and tx_control_port
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 26 juli 2026 22:29:09 schreef Jeff Johnson <jeff.johnson@oss.qualcomm.com>:

> On 7/26/2026 12:37 PM, Johannes Berg wrote:
>> On Sun, 2026-07-26 at 21:25 +0200, Arend van Spriel wrote:
>>> Having a single place for cookie assignment and keeping that
>>> responsibility in the cfg80211 subsystem is a logical choice as it
>>> handles the userspace nl80211 API. add_nan_func already does this:
>>> cfg80211 calls cfg80211_assign_cookie() before invoking the driver.
>>> Apply the same pattern to remain_on_channel, mgmt_tx, probe_peer and
>>> tx_control_port by pre-assigning the cookie in the nl80211 command
>>> handlers before the rdev_* call. For tx_control_port the cookie is
>>> only pre-assigned when the caller requests an ack (cookie pointer
>>> non-NULL).
>>>
>>> Drivers may still overwrite the value for now; subsequent patches will
>>> remove per-driver cookie generation. Update the cfg80211_ops kerneldoc
>>> to note that the cookie is pre-assigned and drivers must not modify it.
>>>
>>> Assisted-by: Claude:claude-sonnet-4-6
>>
>> Hah, I _knew_ it, just based on the text style, before even reading
>> beyond the cover letter ... I'm starting to even be able to tell the
>> companies apart (not models yet, i.e. you could've told me this was
>> Opus). E.g. "Patch 1 is the enabling change: [...]", "Non-obvious
>> aspects" or "This means the cookie field is threaded through" etc.
>>
>> Fun. What weird times we live in.
>
> Indeed. And yes, I tend to edit the LLM commit text since the tense is often
> wrong and the vocabulary often isn't want I'd use.

@Johannes: Glad you can see the fun of it ;-)

Agree that LLM text show some typical choice of words and phrasing. I only 
edit (or prompt to correct) the text when I do not understand what is 
written, too much words are used, or missing details I care about.

>
>
>>
>> But you forgot S-o-b.
>
> also wrong branch tag: s/-next/wireless-next/

Patchwork seems to have no problem determining the branch/repo.

Will repost with the S-o-B in place.

Gr. AvS
>



