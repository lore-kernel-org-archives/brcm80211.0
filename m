Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F407279DB2
	for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259093; cv=none; b=WlfPQoeNeAx+QNZ0SKabD2VU9vg9tnHovR/FgMZSMZr7P1Ep79D44W5wQ2kE7J34dxR7kQhE9SrErh2MTbE4P0RFeaQ47pSoEhai77a03HoXAxocuBKuU7+RH3c/g/Av/IldWWYxGXtIwGOUYPVIGmrmmQO0G0SDtfVRGQp7Ygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259093; c=relaxed/simple;
	bh=zHZZuz+dsh7Rq8cyvoRuAaGsj1WkcZU7y1nbwvlE6lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlHsYReKKnIh12KPtqgA4YlNdHV9DeVc7d0TS+6BYljLxDjRDykko/ebmEP/XrJov4iu6WnFjLkx7D+5UEUfKNEYA0qVgoAMTTvvR+3vnoGtHS3knQpPVNxQM/8Mv4ou62rbn651bDWfAvlxfjMu7eq5lWvIGprlg2+P7QiR59I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XMqgeS4q; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XMqgeS4q"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70707651960so1365066d6.3
        for <brcm80211@lists.linux.dev>; Wed, 23 Jul 2025 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753259090; x=1753863890; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ayKpcwRvYtK0EhDXuHbYCp34WLgrsSuefhaaE7uX6Fw=;
        b=XMqgeS4qrxSbKwW1SIgdxuvkX0bePGw8/HP9QcUXBMrQCQtNcvXbzof1E5BQV6IVt3
         Rl9kiHEUS6DLwVFGD4MPF5yvl3+2xqD1TK9jChqsrp/LaljOvwWNxK5nMVnJYL+BZwhC
         7s5vFTi/Z1Rq8fjSKZC0TaBIA9vCZHl1ea1yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259090; x=1753863890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayKpcwRvYtK0EhDXuHbYCp34WLgrsSuefhaaE7uX6Fw=;
        b=dBLflyJwtZZZWJs0vvGtpWM0OGxwK69VPWWvYTcgRMWo0Alv6YoZPgU3DHutev9h2k
         FqrNnup50b+3UkmiZUA0ZBQe3VeGKhyUMhobJ+RiNhIfNTkfLR1GpjeqsxP15pUCdW2d
         u8mt35a2GLGzUtn2pOJlBSm4ihNmtJXhXPXLqQbUzNDYGX//t62jN5wxzcvRluP6bkEb
         FXzPzHC6S4RwxI3RhEqiM15fYToaV2yFnEPaZQ7MJnqu4d45RmUAyYfIGMuwJdvGD36i
         bq3zC6Fbs7Kb4RUZ9auJnWOlw2kH5dTeByEpvMFomO4cOYN074Gn95xP59HoCRoYTEzP
         haRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnssGAV2y7hNWgXG57/lAzL/yvCP2OidFBu9IxfCIyBMKpYJoMWBAjFn8bUHHsLLrxf4oM/zgXYlc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc+TngH5/zCbmJ8SOWtYXRQ2gFWafqVl60jVrFp422N9dsHhwP
	eWB2vFpnBqfjQJP4uXy3TRmuc296HnSZ4tMBX+QQ9hcwvlcja7/ivULO8yF0sIYu5A==
X-Gm-Gg: ASbGnct/QxUBK29ubV1EiLtO96xhXDxYNVJ20czqkT2gBNRXHUHZPaZOh2ttA3ncbar
	fjX3ttDV6LE2dL1tsz0KqvbDYZR6DAhyLp5TqrPMpJRYjxnttQt8rPsgkl7j7ZJhgVPDXqzC4xd
	2Hj3VihT04G3bG3suHvYa83AVyrnctT8Qg43GPB1hpugeZELCCcQGynCVLhtuLxWnsqGGPf4bG/
	ZbKhWmGp+XzW9tf1hOfbKUDeYdNxrnVmfDRD+BO9Ofww9Th5aWsPFNk66FNNQ8iTpDeVJohr6Qd
	btD76x6a1Xj/MdmAUP+UwQ3WNIPtzCgvItVkz3DyYZN0Xou+0MxKxtUEwp0e1SCFoVuqI78BowT
	0dsr2N7sHtjDlrC6xiiFQtNJaAei/W6UMqTrSFLYzELdhjDT8w67l08EPFRUoX9o=
X-Google-Smtp-Source: AGHT+IGOHZzWlortsj68aKlGMpOALc3sSrw/3gjV8rBmjPrJGjTFuJ+tfLA6wTlliLWqmdm1E/jCgA==
X-Received: by 2002:a05:6214:300a:b0:700:c46f:3bd with SMTP id 6a1803df08f44-707006ca2a1mr27235426d6.25.1753259090479;
        Wed, 23 Jul 2025 01:24:50 -0700 (PDT)
Received: from [10.176.2.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b921b86sm62071826d6.49.2025.07.23.01.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:24:50 -0700 (PDT)
Message-ID: <0030b46b-d8c2-4a85-9725-4d08b5787830@broadcom.com>
Date: Wed, 23 Jul 2025 10:24:46 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] brcmfmac: Add an error log for brcmf_sdiod_ramrw()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kvalo@kernel.org, sebastian.reichel@collabora.com,
 erick.archer@outlook.com, megi@xff.cz, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org
References: <20250414074232.2342-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250414074232.2342-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/2025 9:42 AM, Wentao Liang wrote:
> The function brcmf_sdio_buscore_activate() calls the function
> brcmf_sdiod_ramrw(), but does not check its return value. Log
> the error message to prevent silent failure if the function fails.

Johannes delegated this to me in patchwork so catching up on what was 
already forgotten. Sorry about that.

The likelihood that writing the reset vector in device memory fails is 
next to nothing, because this step is done after we have written the 
firmware and nvram into device memory. Any issue accessing device memory 
would have cause a failure in those steps. So I suggest to drop this patch.

Regards,
Arend
