Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394D277010
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223969; cv=none; b=oW1VT2l7LRkjaCHiM8t99QsE1iLsmf5qPIAvnZrN5qAgnQfLpBjUemlrjL14fXMOmz3cfnqDy3xroYjkVn+63a1tbX3nQp658W7WE3/PVm/T9GMJnTE90iZCdp73JEuxmsESlBfX8REKNs5kRHMXXVglHdmoFc+PnOZKHqBUvUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223969; c=relaxed/simple;
	bh=nMsJodDov+wAGb/CrWkGyllsTgOTn8x62itIiD86bdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggX+OxBVv2oNLVfSSISO4pKZexwJzP/drs7GY9kAQppAHr17BOq1phMzLzWnqrTo5R7bc89H1rS/5Y2iEqKc6lC/M0RbBj6NB4f74qF0c/vMolukIMSVwuBuYm4ezvFgy6Pr9Te2EXkBJI4NXqvsyf6rwydCR02K28WvkBoW42I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6L6eRjH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6L6eRjH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2295d78b45cso97374495ad.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223967; x=1744828767; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
        b=U6L6eRjHg7qxyh8uHcEoTrMTGhSk4+N3JfjRbRDVLY6ZqFCFpZnk9kQpVOr4jpsJUF
         vVPGxhT0KUT0qJGs+uiUcrz0/jUs50agarDxix2kf3ULbRtRg60O+KwxK6NCsaJ2dDp6
         e5Ux/jBzfGM3ddPj+Vwut2gVFVCryGUxvbU4ssdx81N3jLAAM6QpKZqG0QWBMX66SHwP
         CX7hCXXQg6g5NmMj4mCg7vzJfRtLw2botTrP/GQs1Zk6PqcK5lSwgZVw71iBy7Bixbud
         DjucXxx3cxQlHjOHrP/qds7XVt69Jvl1b+gzs8iO8Z7qoBS8hxxktgzwdLIq7DuAGxbF
         DR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223967; x=1744828767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heFgvknjtFAVnh5LT07oSDFMGA94yfUYilk4Quncd6Y=;
        b=j/bb95ZkTxldwJYz9a2Ot3Z9cwxyr40QjrRmfi7CrI3ST8S4SpVyGde3ifoiFewPsU
         eV7NNXIHnVfO0sGr+/Be5AePDrv0eye5JtUS9fXXIFXO5dZ0imfucSSmWyEAdh3OQ6sy
         CnxJ4Hhn3TU7fcdeZCnmqKTahCCWukq8wjugWwEYFkNnKAOxnMLnZMMEyGdZH1EKvBOL
         9cIQ0fFTHVNid1xbLBY67ClOielqf8UKJDZ8Z4hP1UEQsFvQniKGNksQJ3BdKfObEUOK
         OYS+w84ZO/VfTXDxSlZKUbOWAne0f3KNnu6vwmnqmDuXLnBmZ+gmz12lnExC4FffZBIz
         4I1g==
X-Forwarded-Encrypted: i=1; AJvYcCXwCHRQuVaPQ55QRbR8yQB7Z9OVOcf0J2mB7gY28g7/PLm7cwMz0GfrnULQ/oUI2o+WnP8u1UaEnBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YywmnqlkIzmITqCBZCP45Q1ATCyIFRADrCyNSeQVTs76F5EmVQ8
	com0xS4HIwnM0dQO8XXpPfx7QB0wyvo0oSYi/hcRUzKI9G4M4ih3
X-Gm-Gg: ASbGnctdQQdAYapUq5wuiXWV+y50GZIMv1NzAOWbhDMaWbWYw1D2seF4NMXYFR4Nhm8
	3zIJZV/cS533CPc2Bw9QydNLL343dCOnERH7LPgLZi+mdboQ5vzOyFUiipNuqOpz82OzN5W9O9S
	EXTdPujhC/icgua7ld7yd7vqYs+lXtxQ55LaTGghXp5DZSwXiNni4fbpq7FNKOEZ5NYnVTky2cy
	hdAlEe5BqR9R++r8mYvDtsn/tpLjPc7sCOZz++kMeYnvIxhI+XMUBtizh0bHFGL9PqgT9ijhReB
	AUdogsQVehrYN4ZfeT75mg/aKvLlGosLVH7IYkisZaqo3dVaB3XOvkxPuWCu0BuVFMBONnDuwsC
	iBvxLc7Av0J/QUw==
X-Google-Smtp-Source: AGHT+IGbAcYQ28Tr8ToejeUQ3g8eFYPCcQiv8sSHIhkpS6MKA0JGv+p0sl3c5TBTYw+D7H2xHKtHYw==
X-Received: by 2002:a17:903:2ec8:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22ac3fe6081mr53698205ad.39.1744223967213;
        Wed, 09 Apr 2025 11:39:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62959sm15480135ad.6.2025.04.09.11.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:39:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
Date: Wed, 9 Apr 2025 11:39:22 -0700
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 akpm@linux-foundation.org, jdelvare@suse.com, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com> <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
>> On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
>>> Redesign the parity8() helper as parity_odd(), changing its input type
>>> from u8 to u64 to support broader use cases and its return type from
>>> int to bool to clearly reflect the function's binary output. The
>>> function now returns true for odd parity and false for even parity,
>>> making its behavior more intuitive based on the name.
>>>
>>> Also mark the function with __attribute_const__ to enable better
>>> compiler optimization, as the result depends solely on its input and
>>> has no side effects.
>>>
>>> While more efficient implementations may exist, further optimization is
>>> postponed until a use case in performance-critical paths arises.
>>>
>>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>>   arch/x86/kernel/bootflag.c               |  4 ++--
>>>   drivers/hwmon/spd5118.c                  |  2 +-
>>>   drivers/i3c/master/dw-i3c-master.c       |  2 +-
>>>   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
>>>   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
>>>   include/linux/bitops.h                   | 19 ++++++++++++-------
>>>   6 files changed, 18 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
>>> index 73274d76ce16..86aae4b2bfd5 100644
>>> --- a/arch/x86/kernel/bootflag.c
>>> +++ b/arch/x86/kernel/bootflag.c
>>> @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
>>>   	unsigned long flags;
>>>   
>>>   	if (sbf_port != -1) {
>>> -		if (!parity8(v))
>>> +		if (!parity_odd(v))

What is the benefit of this change all over the place instead of
adding parity_odd() as new API and keeping the old one (just letting
it call the new API) ?

A simple

static inline int parity8(u8 val)
{
	return parity_odd(val);
}

would have done the trick and be much less invasive.

Guenter

