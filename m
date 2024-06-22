Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9DB664
	for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719089853; cv=none; b=u9u6AbKnZ4I606+GdEddsMZwVxAM6zwTXpB/c1GvO0yO+7z7X34YwlY8TE0DiXKv1c610HnYbES72/7M4ugvX8lJTpfACyh+KycZgtWopjn2UlsgKo8rwCX4DuejFPMaB+1MdsCU1envfPf3sk71QCgd1FJXKS7yDd5697X/O04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719089853; c=relaxed/simple;
	bh=eUnPmrc5D8ZkLz919iwpd8FUpywsWQUxj3eJWqTRVkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P/AOdLhPfiJo+Os35ZrSfekyeQ++NEjDjUem7wMQ1DhMGdtuLW9R0GmEsqtHimoQGAoPWwJrh2Oe2sD52mmarGMoirzRfBXlikJW5x9SVKPa3JvpCxblaxwyw+cmJxam/uMFb6gMrJpb+y+pxNIJ6GfyxJ9+W79XJDEioCs25i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu6yhjUY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu6yhjUY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso3418403a12.2
        for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719089850; x=1719694650; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDuouZW9wT93zAqYjaMqCHOs9/kAyeb6T4KmmMAcbBg=;
        b=Bu6yhjUYsw64DsGaioQa2nkHrf6tnHlf54Ut0N37oslBgSX/YAHrXJ7vy5x1XhyKKG
         6kdPuNDolPySyJ918zTbVqavvb35cHRcPY+7QkOxwOjyg8hoK0gLyaKtGRwa+xCouDZT
         inZIGsvDEXBD/MtP4rsmuDpWWQ+l9ed0ByVM8C5gUfPvLIXXdbml14jmQq6qXD09uO85
         2sdPaeyJq4bisp31/CUpAyPA0dGs31wmZUnoheosYJE2WB0G4WewAqFYXxixXKxdjTS1
         Xqb7I3IckWpT4dxLm4+pF8MMwH2ov/zHa/4CFw/j4vhENbZSgGokiIJlpEJi3c9PW24F
         GavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719089850; x=1719694650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDuouZW9wT93zAqYjaMqCHOs9/kAyeb6T4KmmMAcbBg=;
        b=LbIsI3G0dRF13PtBDqeTCGXGq/n+vE3itSzcWvBP2PJe5Mfz40xg9cPEjx9cJ3I5mb
         saL3k5EMrW3L0qTt1bBPu2oS+jqgcQW2xHtz1ovB3Gmiux+gRVTlG8kWS8vdsTZMbsHo
         JuNeD9ifkBsvwlGdYKXeLlSkW8IUO6w7HMB1lwuSt1AwEYnff3u0/H+qBZTrjxxgfujE
         bm1eMTSDTneIQ4Ycm7zkMLGP++eNyVZzwEZez/uvOLRqqcXaEHlQlra2APVbjvZY1HS2
         nZvWv9kegSBME7qmFI3pdVwPux0XCKsq7IBYn9fRfbWmruI5H6Uv9BavOmfZRXpo3+sc
         YrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5a2mdx1wE7IEne0fA/pEw0/SGD2WJtmlAQZqvcnHL3s2b8VzHpGEkuWGI9Uu4Ysd7JiMsVB/dr0W/SkRjm3cjYIAyvmRrXtE
X-Gm-Message-State: AOJu0YxZda2HARvb6W+Svyew4tY5t2zRH0gChiRurLNyn94gmm0JVjff
	oYh4kqI1gCN/g0DXnxgGX7I1n+55ceE8lZHmGoQePuA/26VLR3M=
X-Google-Smtp-Source: AGHT+IE8pWzEn3GYGJmVaQOhWZnN4MyxbNOiMYpmw4jr1uhP8B0tULVgmQ43KQ9QX4yiRyTUOyLFxw==
X-Received: by 2002:a50:ccc8:0:b0:57c:5fc8:c95d with SMTP id 4fb4d7f45d1cf-57d4bd720cfmr520591a12.18.1719089849669;
        Sat, 22 Jun 2024 13:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:108d:ce41:c0b8:26cd? ([2a02:810b:f40:4600:108d:ce41:c0b8:26cd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042d8b1sm2760722a12.45.2024.06.22.13.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 13:57:29 -0700 (PDT)
Message-ID: <d17fe45e-3cf6-40cb-a2a7-b690d7b7056d@gmail.com>
Date: Sat, 22 Jun 2024 22:57:28 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: of: Support interrupts-extended
To: Arend Van Spriel <arend.vanspriel@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20240621225558.280462-1-knaerzche@gmail.com>
 <190402b87a8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <19040354ba8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <f81489b4-ed60-43df-826a-1f9593802be8@gmail.com>
 <190410e7d38.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <190410e7d38.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 22.06.24 um 19:46 schrieb Arend Van Spriel:
> On June 22, 2024 4:07:40 PM Alex Bee <knaerzche@gmail.com> wrote:
>
>> Am 22.06.24 um 15:49 schrieb Arend Van Spriel:
>>> On June 22, 2024 3:38:32 PM Arend Van Spriel
>>> <arend.vanspriel@broadcom.com> wrote:
>>>
>>>> On June 22, 2024 12:56:02 AM Alex Bee <knaerzche@gmail.com> wrote:
>>>>
>>>>> This "new" version of defining external interrupts is around for a 
>>>>> very
>>>>> long time now and supported and preferred by irq_of_parse_and_map
>>>>> respectively of_irq_parse_one.
>>>>>
>>>>> Support it in brcmfmac as well by checking if either "interrupts" or
>>>>> "interrupts-extended" property exists as indication if
>>>>> irq_of_parse_and_map
>>>>> should be called.
>>>>
>>>> All very interesting, but why should we add code for something that
>>>> is not
>>>> specified in the bindings documentation?
>>>>
>>>> NAK (for now). Feel free to update the bindings document.
>> Sure, if you insist on it, I can update the bindings document. So far 
>> not
>> many (no) users did that, as it is clearly specified as an 
>> alternative in
>> devicetree/bindings/interrupt-controller/interrupts.txt (sure, it's 
>> not yet
>> converted to yaml yet).
>
> Right. So in my opinion that should be handled by the interrupt 
> subsystem. Hence I dived into irq_of_parse_and_map(). I would suggest 
> to open code that:
>
And as you can see: It's already handled by the interrupt subsystem - all
what prevents it from working in it's intended behavior is this strange
of_property_present check.
> /* make sure there are interrupts defined in the node */
> - if (!of_property_present(np, "interrupts"))
> + if (of_irq_parse_one(...))
>  return;
>
Agreed. That's even better - I also didn't fully understand why this
of_property_present was chosen in the first place. Actually I wanted to
send something similar first with only calling of_irq_parse_one and return
early if it fails, but the result doesn't allow to differentiate between
"no interrupt defined" and "interrupt mapping failed" - so open coding it
seems required, unfortunately..
> irq = irq_create_of_mapping(...);
>
>> Which is a much nicer form, imho.
>> And by the way for instance
>> arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts already uses it that 
>> way
>> and the interrupt will currently not picked up (at least not by this
>> driver).
>
> I expected the "nicer" argument would be thrown in at some point. 
> Esthetics are never a technical argument, but let's not debate that 
> ;-) Hopefully you can agree with my suggestion.
>
I wouldn't want the 'nicer'-argument to be an argument, as I don't like
that either: so sorry for that. My point was: Why wouldn’t we support it
in brcmfmac also?

So will resend with you suggestion applied: Remove !of_property_present
check completely and do the two steps of_irq_parse_one and
irq_create_of_mapping separately.

Alex

> Regards,
> Arend
>
>
