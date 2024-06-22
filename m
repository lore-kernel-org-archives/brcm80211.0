Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C416EC10
	for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719065263; cv=none; b=W/W5grvCRI4Mzg4/V1tdaKpgMZjVozJOq0+PH4mt/QJWrbQdHJZXnyQTMJajTlNJP7m1geCsIMFdgvYIDg2TJt8ejP3rZlT76fctLapWVCLvAhjcDrH1xl+PgPURWBDXw9v+o4SHodlXjlDGKKRtqzG8zUXcjZN972n6AnVtYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719065263; c=relaxed/simple;
	bh=qZ69BoS6fsBopPZdevAkHDsYA/iI06IZOhkw39qW2Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nDLh26MCaZx6N3QFFgk2EE6V2Afx9yvQge70Hhu7XhkdyDMIRtj5I/b9s6Xw9M19EqJetMRoXwDcsVk2+ayl7yAPyB2jdn+WTWavHzxJaNCTGnXLGvp1XIHCzOIDmOOZsmrI27Pe1oHLFkL4tjJaS4z3Yoo6ea/F1SnIM9a8D/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXCTxAmy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXCTxAmy"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a724440f597so8631466b.0
        for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719065259; x=1719670059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thH1Pr6dX+Q8kkJ5omnlnmrOhD3hsrzwW3iGCChkDi4=;
        b=VXCTxAmy7jWcynzecuPOq/uXgE3Ga2ucc9McXl2Tt7fEDLBNNV4b2wgEUPxJMr9EYS
         +PoT4CiYHfVYEQn6/yQp7zZNK48gDU4QVXjlAQvc7VrDy3yehsqWcpP7RZ4EOxl0uIIl
         sQ8pqkZoNat/m21am6OCvs0JAjr6tNTqeMEkOxkpwo5wgIydSseUgeAgkjOK7szZCpo2
         yNuE8IBRyDqCv9Z1KWVa+8J3Zfp8uGWPPd7v+9lL3TXZJCYkoStXJS5v/5HyeKIp+Dms
         YLpX+6JrmDl4YkxRQylPHZ03qXEMc/GNACekZ51ylkr1QTd5ixsocfY1AoOs5zQJmNrp
         DPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719065259; x=1719670059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thH1Pr6dX+Q8kkJ5omnlnmrOhD3hsrzwW3iGCChkDi4=;
        b=YU9YItkX44weNlLq+Vfvo+rmslmIKjQI6PCXE1n8F1TET5BMmE+VATNi90vcx8gK6x
         Uck8P5/clTK2cDD3lOCgd2Q/3LoHQafbgprEtPFdXYmWod9UWgYMlhYpKTrqSUNotPb+
         7yC2k+atqbubLnEWz87qy69BI/xZBbfKDU+dlzOR2OBtIJn7ht2lq8zczTjfhiLQYbU7
         Vz350hcnheQZ1F/ntd7mQAdtVexcjOgmuuygDBsUoCabIHSmpB8pplNP6GEjZ4OOGSbf
         iWDDw6Tza3BNKbKGYEqWYvRuZIa03Q369sJ+cRxKFFvlJti44MOYipMqK5kEtY+/9ihP
         bSng==
X-Forwarded-Encrypted: i=1; AJvYcCVdicJ0ge526O601/SZmvffAdlmtTzqdxRmD/J7C3Ney1IdVYO2V6BNvMEHQSeUyxRyh9HL77T/gSIIRIMQfDBhjz1KFGrkd3VT
X-Gm-Message-State: AOJu0Yy0wHmiHPyo8BysqaupxbzVFnI294Y/abcnP+aNlpLSpxmZFO3U
	4ukBF3ZQ5BFpmh1wcFFbUcc7P4nwN464dUTLZMJVNitafhFP2xk=
X-Google-Smtp-Source: AGHT+IGLW5AbuBjd06LIvqUm9HuLBn2tIrCrY5ppWmKqqYQchEPKqkeHDut98ekeie6/0WqiJR4AiA==
X-Received: by 2002:a17:907:d406:b0:a6f:68b6:4e75 with SMTP id a640c23a62f3a-a6fab60ba77mr680327266b.5.1719065258320;
        Sat, 22 Jun 2024 07:07:38 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:818f:ca1:d4f4:472d? ([2a02:810b:f40:4600:818f:ca1:d4f4:472d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe4eeb106sm80483366b.167.2024.06.22.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:07:38 -0700 (PDT)
Message-ID: <f81489b4-ed60-43df-826a-1f9593802be8@gmail.com>
Date: Sat, 22 Jun 2024 16:07:37 +0200
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
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <19040354ba8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 22.06.24 um 15:49 schrieb Arend Van Spriel:
> On June 22, 2024 3:38:32 PM Arend Van Spriel 
> <arend.vanspriel@broadcom.com> wrote:
>
>> On June 22, 2024 12:56:02 AM Alex Bee <knaerzche@gmail.com> wrote:
>>
>>> This "new" version of defining external interrupts is around for a very
>>> long time now and supported and preferred by irq_of_parse_and_map
>>> respectively of_irq_parse_one.
>>>
>>> Support it in brcmfmac as well by checking if either "interrupts" or
>>> "interrupts-extended" property exists as indication if 
>>> irq_of_parse_and_map
>>> should be called.
>>
>> All very interesting, but why should we add code for something that 
>> is not
>> specified in the bindings documentation?
>>
>> NAK (for now). Feel free to update the bindings document.
>
Sure, if you insist on it, I can update the bindings document. So far not
many (no) users did that, as it is clearly specified as an alternative in
devicetree/bindings/interrupt-controller/interrupts.txt (sure, it's not yet
converted to yaml yet).
> So looked up the interrupts-extended definition:
>
> The "interrupts-extended" property is a special form; useful when a 
> node needs
> to reference multiple interrupt parents or a different interrupt 
> parent than
> the inherited one. Each entry in this property contains both the 
> parent phandle
> and the interrupt specifier.
>
They point in this particular case is not how many interrupts exsist, but
"... or a different interrupt parent than
the inherited ..." which is almost always the case for brcmfmac, as it
usually specifies a gpio controller as interrupt parent. So:

...
         interrupt-parent = <&gpio0>;
         interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
...

gets to (a single line):
...
     interrupts-extended:  = <&gpio0 RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
...

Which is a much nicer form, imho.
And by the way for instance
arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts already uses it that way
and the interrupt will currently not picked up (at least not by this
driver).

Alex

> Given that brcmfmac device will only have one interrupt item defined 
> there is no need to use it. If someone can give a good argument to 
> support it please chime in.
>
> Regards,
> Arend
>
>
>
