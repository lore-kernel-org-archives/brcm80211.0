Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207CF1304AB
	for <brcm80211@lists.linux.dev>; Mon, 29 Jul 2024 08:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240361; cv=none; b=qBfiUiXUjzNbacJ9n+pKOaZJa11qOe19PeSSXJk6r5i6Nr4LWZ57uezBi1RDAehUamUQySvW+GzsQ0xc76/s2m17EhZ80LwHwn4nrJ+LByD8R56RkKUfampfR+vgQ7f3bHYuPy3sNwVfBCd9j8Dn3ybYC2ysCbGmzt0wy9PetPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240361; c=relaxed/simple;
	bh=n8Rx/zdmS57QY4dB3glmMrAOg1vw7OYCpVhNhDCu8BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/kkLYG9pH+7Eg65AWywSfNQVnwFPUoRsL8F49JJ/y7RxeWIb4N7aWT7uWhNbTjKo+rpjh0+J/3Vfp2Yoyh6qg1HI6LmrepPmYV64aTY0rC38dvrll8TYywRgbdYLHk6snoOXstntbZ9XfRaRn2ysChJaMDL6Q88QaGsldbXfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=K1NkJI6p; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K1NkJI6p"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ad86f3cc34so16832656d6.1
        for <brcm80211@lists.linux.dev>; Mon, 29 Jul 2024 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722240359; x=1722845159; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OLxQ+oltHXvWTm73jCnAzYaGS2Qwqp5wgJznleOQdko=;
        b=K1NkJI6p4wHMPTmT87eBLtYRPCRY/BAekVXqMhbbenqSltvdssBtE+EMrjjAfCSFOF
         5E+GWxNytd9UH3RB4RytgCC9ER2WOMF3xXpfYrbSQe8328LVYoOUN0QA8umEW9LfGJpy
         Epi+2QrLMT8h5+fNrybpJd39l3YVlgKChfGms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240359; x=1722845159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLxQ+oltHXvWTm73jCnAzYaGS2Qwqp5wgJznleOQdko=;
        b=I5FG8Y6tQX7Oe6OUGmoxWAYARSRmxKJBYBHb86G+PtasAtGm0EkxaPZucwan171n4T
         S1mIk2D5hKbDf1en6aWfk9w1iYvXYfDQ6CmA8d8sq09iJWYGwngdPx8+5npV6BulLlhz
         KxT/k5Z4pwQ9O2L9KGXlomWl6vqCeOAajM7ejtsxSUL6ZZYNWRcihrnVBV+bDvjSwput
         uQS2Alof4szH53RO14oaQpf3DRXKHZtZ1H1lIlWx6Vl7eWLZNPMJFbHQ34ss0S2HAxAY
         YeCq2ETexc3at84mqvYH56CZrTBaQhuk6UcquAhLHIKDn1nml3GSHAa/jzKnYbtWnOpo
         QuVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfw5i/vefZIGQMppfRpZVmEUMTe9QYIlwER1hRFW1suFyLDrpEeoWIUe6GUQTXsutXrKHLY+PcSHLezUFp53kKd4fuE7lsAWnM
X-Gm-Message-State: AOJu0YxJorqFJh5Ddf4RzPNoy9I8YwTSTT1D4toHVnpuLkVMDWG6uOef
	cdJfPRjSr+mZnullqbwzGjmW1Df0zQD3Y5EQYrGUKht4FTzFbYcOfaFxyZfH80NGWk1VEch9zlO
	H1Y9D
X-Google-Smtp-Source: AGHT+IHDxRS/Qj/GgqaFGs7FuOIX0yBdKNkaZhJs4PVEqzZvCi316pZ+Yn2S8PHH0tjxLiWg/3zRpw==
X-Received: by 2002:ad4:5ae1:0:b0:6b5:23eb:3a4d with SMTP id 6a1803df08f44-6bb55a0cd98mr109431496d6.27.1722240359085;
        Mon, 29 Jul 2024 01:05:59 -0700 (PDT)
Received: from [10.176.68.61] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f922b63sm48741156d6.67.2024.07.29.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 01:05:58 -0700 (PDT)
Message-ID: <d14bcb85-2b43-4961-863f-42eb14227051@broadcom.com>
Date: Mon, 29 Jul 2024 10:05:56 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT v2] wifi: brcmfmac: add flag for random seed during firmware
 download
To: Jacobe Zang <jacobe.zang@wesion.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>
References: <20240728193904.35820-1-arend.vanspriel@broadcom.com>
 <TYZPR03MB700147CA6C80F34B8E3D5CC280B72@TYZPR03MB7001.apcprd03.prod.outlook.com>
 <TYZPR03MB70019A591F0717F365A3392280B72@TYZPR03MB7001.apcprd03.prod.outlook.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <TYZPR03MB70019A591F0717F365A3392280B72@TYZPR03MB7001.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/2024 8:25 AM, Jacobe Zang wrote:
>> I found that in drivers/net/wirless/broadcom/brcm80211/brcmfmac/bus.h has already prepared an > enumeration like these.
>> enum brcmf_fwvendor {
>>          BRCMF_FWVENDOR_WCC,
>>          BRCMF_FWVENDOR_CYW,
>>          BRCMF_FWVENDOR_BCA,
>>          /* keep last */
>>          BRCMF_FWVENDOR_NUM,
>>          BRCMF_FWVENDOR_INVALID
>> };
>> So should we delete them? Because you also changed BRCMF_FWVENDOR_ to BRCMF_DRVDATA_
> 
> Sorry, please ignore this comment, I didn't notice these were two enums with different purposes

Ignored ;-)
