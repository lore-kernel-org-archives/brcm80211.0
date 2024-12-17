Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90381FA840
	for <brcm80211@lists.linux.dev>; Tue, 17 Dec 2024 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464715; cv=none; b=CdlMXFQzsVUiuQWw7bcUPXSMYaIx0ImZMaBa62hG9JP1lZM19AsEZK1oRwR6N8jA4VjX/u1o40GsBYI93Giy75+698l8gijsugS4acodc70YWCSUwvBa0ZSitPbQUPZJHIqV7Utw24AEakNWnzc8bIYoNM1dlOTjhl65sST3KsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464715; c=relaxed/simple;
	bh=K9a3TAroGQk9c21dSgYvZCzwXuGeglfYX98EI2j1L6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5wc6+nNc5TURjbjt7GOZ6CDEm48KY3w70QtW4z7Pk9BZbParPGP1N36gjZEQiM2DhsqhFd8sklZUg9d9iwMyFD9Jem+SIHKlXzOKPfDRttqSQdXioBSRIsftCIzcjWjwIjt96deEbYegVAe4ATVrYPpIPZBl8F5M0RPStFt564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OynroRcq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OynroRcq"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e9317a2aso4737185a.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Dec 2024 11:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734464712; x=1735069512; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FlvCaVRTG5RbB0toEEC2aB/HJBFlNZh5eVaMEPQ26Bk=;
        b=OynroRcqEVevtShLmwnFhe+kib3EB5kmBdsSIwNHQ/SXW2tqTKTDSplT8EBTYWVRyO
         CtySc1OuYcAeqjYHMiAtUQnrbyCfU5irwGT7c0+/pfkcFBc5cGaWWWE+InNOus95PXbP
         HVkoSCIgHZtJdMx32+lSVyv1W37Kl4zbhTbLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734464712; x=1735069512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlvCaVRTG5RbB0toEEC2aB/HJBFlNZh5eVaMEPQ26Bk=;
        b=JAfarSTUQIygZdod3wQ+a12Lz0IB4sHs47hUTDGrlaBOAZW+o4OOs+oG+EuPu7Gi/b
         0MPq1jhsevVt3w8x82zYh2Kl07E32fHMlJlJyjRkcsN8MCQVVEHiNSUn7IYRH3GklQ3n
         wKZ7hYMLdDU8XG4ojL5xVG74sN3/7HXK9lBpGVEYHLrb5l72ekPAGM81Jg0X5U4gC4pu
         6wgRBOMbueUQdMaTDpQQxT9wBW5UhVBCkq7vyzgu/f2HjE2RTfg9AEEKYdFG3aaa1wat
         oaducV2WRXWv7SVYDGvlzlXPMRz7n8gfBJ9vJzLMK3vbaYkn8jV+bEJP91aCZoimvgR6
         b58w==
X-Forwarded-Encrypted: i=1; AJvYcCXhzmuVNEAIvbBbTyhByrGHsL04dRiKktQUJ6H7z3ukN+uTMH5tbcT1LbwMMDX7twYuBDHT3Ecg0S0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQyfKOzgV2Hj6/rIkNUUM3kniNG7qizya3WsHEL0ihmNquF2Gw
	wXaEwxnBfaNYFR7ZVFlE7CvzTHPI2WxeAjzjI2ZYSKwFmZB2ZCQdjKeyvbS1ZQ==
X-Gm-Gg: ASbGnct/JXCQlUXSpY/0Gwi6z379H8lOLu2k8rsCZvQlVyEN2AkZtnyLg5G99Bu2swY
	20KTiBRgVnqtYIdWYDF6a3V4/dRpruxZr1BThwOGkDDWKSpJR+3T4wQoZnhHCQEHx5bwCx+A4Kd
	37MWHjn/sQVN8Tty7jWSCTuTrvdrtlbZ/g9QqPY32siQJwqOwUGAQjAwyx7aYJSRfLHg5LnO2Ou
	EsqVWfQzfcngw935Qc8rB8Gp3HRVpdoB7em78ze5lTbPAOPnEXuRRkurX5zYidrwm+uoewEMrVr
	DYH2ktQyboFeTWlKKPGIZBOygLw8G2NP
X-Google-Smtp-Source: AGHT+IENR8d7K737V9UsKuEY9Re+jcfCYW2gO9GgSAtL2H78K8KVsdt5PTDAzcSOZYavvWX8UHCZvQ==
X-Received: by 2002:a05:620a:28c9:b0:7b6:eba3:2dfb with SMTP id af79cd13be357-7b8635fe7a8mr7516385a.16.1734464711948;
        Tue, 17 Dec 2024 11:45:11 -0800 (PST)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa68fsm349109785a.13.2024.12.17.11.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 11:45:10 -0800 (PST)
Message-ID: <6b905cd0-96c1-4164-908b-5219b0d85108@broadcom.com>
Date: Tue, 17 Dec 2024 20:45:03 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcmfmac: fix RSSI report in AP mode
To: Alex Shumsky <alexthreed@gmail.com>
Cc: linux-wireless@vger.kernel.org, Alexey Berezhok <a@bayrepo.ru>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Kalle Valo <kvalo@kernel.org>, Kees Cook <kees@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241122210346.2848578-1-alexthreed@gmail.com>
 <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com>
 <CAF4oh-Pbbu-LJ22yyx95Zrw0rgwRHo_tEqhCnrRHRBHqADS8CA@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <CAF4oh-Pbbu-LJ22yyx95Zrw0rgwRHo_tEqhCnrRHRBHqADS8CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/2024 7:54 PM, Alex Shumsky wrote:
> On Tue, Nov 26, 2024 at 2:13 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 11/22/2024 10:03 PM, Alex Shumsky wrote:
>>> After commit 9a1590934d9a ("brcmfmac: correctly report average RSSI in
>>> station info") it is required from firmware to provide rx_lastpkt_rssi.
>>> If this field is not provided brcmfmac doesn't report any RSSI at all.
>>> Unfortunately some firmwares doesn't provide it. One example is firmware
>>> for BCM43455 found in Raspbberry Pi.
>>> See https://github.com/raspberrypi/linux/issues/4574
>>>
>>> Fix it by falling back to rssi field if rx_lastpkt_rssi is not provided
>>> (like it was before 9a1590934d9a).
>>
>> Sounds like a reasonable approach. However, I would like to learn more
>> about the issue. Maybe it is a per-vendor issue so I am interested what
>> the sta_info version is that we get from firmware. It is printed in
>> brcmf_cfg80211_get_station() with brcmf_dbg(). You can make it a
>> bphy_err() call instead or enable TRACE level debug messages in the driver.
>>
>> Also would be good to know the firmware version and kernel version of
>> the BCM43455.
>>
>> Regards,
>> Arend
> 
> Hi Arend,
> 
> Is the info I have provided sufficient?

I am missing the kernel version and whether it is upstream kernel or not.

Regards,
Arend
