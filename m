Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF8148FE6
	for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748197039; cv=none; b=SzJ4lVEhfOEqJcfZI2jeRaDMeD670E0OjShoG1sVsZ4fKO7UfxAChCEytaBrj7uxlv6GBM68jgRutNypAA7Uhr26Al2qHrVGgmt5byw1gW2Da37bRsJWLKS5xIKbXP0RiW/Jbyq44JuR6Y75yt43vaDsh2Z44Qjf13d+rtQ01Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748197039; c=relaxed/simple;
	bh=cqtdVPRhi8dAMjmbcBshasgssV5brMNGfELHpoBvHd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auzd6n6bSKC64FnzhnrojNwRjB7ZGGVSzTsdI450QMW5VMna1Q6DOeXb89JBcdvL6Nl9XOxDsVDYAul8HSaLUZ6oMy/SCJHnfFRYshPTxpfjJvx1mkTxQkaBlWKg3El5D3+6XxoLm5dVWZoTq5/CWF04JmH0GX9iIc/vfqdt5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PZl3zmOe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PZl3zmOe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad5574b59c0so299886966b.2
        for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748197034; x=1748801834; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzqrZVB5rPSd8o0nKaR6qgLjLnrJaYEakEmdqqrlmeI=;
        b=PZl3zmOe4+EG7gr0wffkW3sitYF53xcFyPuZHrX+AuTUQK0gKKW1IuxCg2GyksYToB
         5kbur4im3Tigps0hZAW/KLDq9USTfdhPjVU44y1gFPINCTbtTA5Ks7jduwmULjIi4kHb
         EGJ6zLsvxFyaf+AesmCq3haLKOFsX4zE8Dznk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748197034; x=1748801834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzqrZVB5rPSd8o0nKaR6qgLjLnrJaYEakEmdqqrlmeI=;
        b=HZaKOnaqOyptNI8aswY76coe9FNbwUe0NXiQnCVjN0bwgTI9mtPCc3pIP2hA+HcyDi
         dOpGOFOQGq7jLH87Fq60cVOHomJ0c16ZMmqUI+P6dtPgZnZV4TZf5uV/meeJGmrRtAeO
         tVvXkaZkvbLNTYtVvDIOvqrZ5n02ofKvbne87GNtGbHQIu3fzpQ2H/o4MtsD1KwP5oRw
         89teb0wF5F5MDADUAk6SGoK4ijHKtnCt8BzSH+1l6Jy0+HdFR9fn1CmCBR0YnSmPtV0A
         4NGE3dcrCRe/dRXiFojHb97GZpmToao5q07WbHxXzrdnHW/OBVS4CTA/tesUR5w4Sy5O
         vE4A==
X-Gm-Message-State: AOJu0YxMoa1fInd4y60Klwqc6HZU2XC9fRfB28xAj8HkqHBXpFv3K/po
	K9sJA7cWFiofIrO2SS4oBnkUMG5MsVGUn//Sm52evmkLXOCwhsJY26wkXretLA+YEA==
X-Gm-Gg: ASbGncucfIKSzg+PSP02d1TNDBrWjrDclcah7RAd3th1nMaW5u/ZTfKBaQkiuT0Q7L7
	kNK7FWhrV6Lkr6wQn7XxVqp5S3eSiNerJ/Eu6r54mp9g+TeX4KEv5W/O2Ak/yx/NKQw2qWZBYc4
	U5VA/8LwgYq5MTzl4O3ichMiaSvfhArzo8CGEGQyL6TZIZDqxXMm6A/x/OYK1zdpcC4G51pAupg
	O0vJvvz48DwgYkkSOKzPn1ouTat/jFz/hD1lMlgWQZ4er+ywyDwmJ5R/GzSk07LR3Wk9o7LIURb
	4/dDj7uY4ZxLLS3ELUnYIe6my5vu4OdZ8DNOLyqM597Au0/FhncTlEi9Wmlgoc4dYrNE+yTV/sj
	GeybyTQ644Jv1Tj6SFIx9+rYb720=
X-Google-Smtp-Source: AGHT+IFL9bs4iRswIlUUDBqY/EWDa6P3FC4yXJxLybgjS1YVDIhVXvAkyyyUR6aXTQk2gxIJc+9/Mw==
X-Received: by 2002:a17:906:ef05:b0:acb:b267:436b with SMTP id a640c23a62f3a-ad85b0ea786mr571243966b.25.1748197034199;
        Sun, 25 May 2025 11:17:14 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1571875666b.19.2025.05.25.11.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 11:17:13 -0700 (PDT)
Message-ID: <9bccdc60-7c4f-42f8-b470-86fac4842115@broadcom.com>
Date: Sun, 25 May 2025 20:17:12 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth
 support for Infineon devices
To: Johannes Berg <johannes@sipsolutions.net>,
 Tim Harvey <tharvey@gateworks.com>
Cc: brcm80211@lists.linux.dev, linux-wireless
 <linux-wireless@vger.kernel.org>, hostap@lists.infradead.org
References: <CAJ+vNU2pLJd696Fc_98arrzs8QK70HfstPrZv6zVJm3G13REHQ@mail.gmail.com>
 <196d7901068.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAJ+vNU009QSwYopCFzZtwDNXDBppx7L4v_ZKtmNZ=5ep7trOSA@mail.gmail.com>
 <c3ed7fd4-f4ac-4d23-bed1-78d5bd615ec5@broadcom.com>
 <66ab4bd4e87b20004f7acd751674b0b9712164ca.camel@sipsolutions.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <66ab4bd4e87b20004f7acd751674b0b9712164ca.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/25/2025 2:24 PM, Johannes Berg wrote:
> On Sun, 2025-05-25 at 11:47 +0200, Arend van Spriel wrote:
>>
>>> [  161.608607] ------------[ cut here ]------------
>>> [  161.608646] memcpy: detected field-spanning write (size 104) of
>>> single field "&mgmt_frame->u" at drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c:307 (size 26)
>>
>> Okay. I do not run with that Kconfig option. Will have to look into how
>> to fix this. Probably need some kind of annotation. If you know what is
>> needed feel free to post a patch for it.
> 
> I think just copy to mgmt_frame->u.body instead of ->u itself.

My gutt feeling was telling me the same when I was looking at it 
earlier. Thanks for the confirmation although your phrasing seems 
cautious ;-)

Regards,
Arend
