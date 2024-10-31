Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96019AD78
	for <brcm80211@lists.linux.dev>; Thu, 31 Oct 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385987; cv=none; b=bu8jnCiA96+r9rNpfethpS9brZw4r98HDlAzoELH03vyFij2/hzJ7oPLZXBm96p0KwebkIPSCHs/J7SjtCEQ3vC1gXBk8KH5vhwmIKtubhT3okWshS+z19hZ5Lw74a8UFLXkL7RJctM2+CQJogUa4YDwHMMA3L0bTgrn/hycgug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385987; c=relaxed/simple;
	bh=G3k8YCPLvT/vD+woarb58oSt9eiPRkiyHHDZR/GB9XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0wMu5AOEy8Ov2FZa+GSSVBF411B2OPfiFSSsQy+p9JxCvfltLtgPZrMX5M+hGTBxDVHEyznUI6FyeWWNncS7YWOI9SfflXld30mfnZQTD+4rCanFjFqHZMQedRHXDQJmwqcBIZ9recu0rmThaQ1h0ihXRUAYOxGjHz5EKfez9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtqupJjf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtqupJjf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so8327305e9.3
        for <brcm80211@lists.linux.dev>; Thu, 31 Oct 2024 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730385984; x=1730990784; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+R2z2Hq8YdiXOzRMQtJlJNAR8ul2IAPxkBdT8ZGZaI=;
        b=NtqupJjfW8/pMKO4JO6xjuA559Igsl/2S6OJRcifhXU7m1GFGZOTgyf6HTPNojg7nR
         Fujh1wbQbnHPMyzkew6kPjcabrbv6HyZAY2M92HT1huUb8TVbv/+w9dCQV+jI5j7rOqI
         pXlMbnfBXJOuCFUyutS5n9/Z/qqP1CbLuDdrPTWZMTIKSHkqoZ0bvQAkNFqXVzStsjK9
         tRujApU0qil7+8rRCyIzbirKpeIvZr8aab5mfYeNGhzo6Mg/MhrbN6xWgFdfvBznvRJz
         5oKsSuHdD2x4gKnYdsoKyTYuGNLmxyQcUKvi13rE46JagcOmhrXEih6ZEnsVNqBoYG1O
         QPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385984; x=1730990784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+R2z2Hq8YdiXOzRMQtJlJNAR8ul2IAPxkBdT8ZGZaI=;
        b=PKCdLEJ9ta8zUWnFIO+VZsReu1L/QlS79TdjhEbF4OeK+sdHf8EJ+TbSMpepG22LuU
         4zqUE4N6bjN+O98Y7Q8AhDxVTrgFU5qrXcxn5RBqi1Bv8/htcJXTCKg99w42z6EmGZ6F
         N63l82uc9WB3eDg6h4kGWloV2wVGtSBhri/BRRrJ126p/PNgLrBLLYGn/5+0e/OzNieq
         Yf804Hn1GtnTeLLLZN2esPR2xLs/+i6ciHYw77wJLS466YtrIy/Hfw0pYxIup5+6m1Lt
         WUxr3Nz0Um0solR5HvLE0rChQCdA7JnjgAHqBYBcqrHdANd80EOofH2RC9FSkxbzN3yh
         yeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7qO2SUoABsHDVSFkiZ3OzezKUBiytSTeVjFQ7ndBikPSk4Oe3MECh9sneYJexZ3BuRSohnylj9Dk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQFbv+4Ubo9eOjY8aHDfBVSA7Vp6mojFircadVDlWGMW4RmPzD
	+lurvtYJMKUff6GUi1xTGLljLbVuML9ypVkaTCY1XOsXES0PT7ZH
X-Google-Smtp-Source: AGHT+IH9Re7qI11bFWjzdKhmKNOoTKp5aILEFXvdHmzSO7KktOHqim6bI57kv3Ke9l9/aFvrvDBnCQ==
X-Received: by 2002:a5d:6da6:0:b0:37d:501f:483f with SMTP id ffacd0b85a97d-381c7ab2fb6mr155006f8f.44.1730385983595;
        Thu, 31 Oct 2024 07:46:23 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:d7b9:afdb:c541:d023? (2a02-8389-41cf-e200-d7b9-afdb-c541-d023.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7b9:afdb:c541:d023])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d439esm2316878f8f.44.2024.10.31.07.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 07:46:23 -0700 (PDT)
Message-ID: <fc0657cd-083c-4abe-8f27-0b5a49cdd35a@gmail.com>
Date: Thu, 31 Oct 2024 15:46:21 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: brcmfmac: release 'root' node in all execution
 paths
To: Kalle Valo <kvalo@kernel.org>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241030-brcmfmac-of-cleanup-v1-1-0b90eefb4279@gmail.com>
 <173038429759.539202.17634636965892286169.kvalo@kernel.org>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <173038429759.539202.17634636965892286169.kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/10/2024 15:18, Kalle Valo wrote:
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
> 
>> The fixed patch introduced an additional condition to enter the scope
>> where the 'root' device_node is released (!settings->board_type,
>> currently 'err'), which avoid decrementing the refcount with a call to
>> of_node_put() if that second condition is not satisfied.
>>
>> Move the call to of_node_put() to the point where 'root' is no longer
>> required to avoid leaking the resource if err is not zero.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 7682de8b3351 ("wifi: brcmfmac: of: Fetch Apple properties")
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 
> Wireless patches go to wireless trees, not net. But no need to resend because
> of this. And I think wireless-next is approriate for this fix.
> 


Sorry, the second link from your signature explains very well what I
should have done. I will keep that in mind for the next patch(es) to
wireless.

Thank you and best regards,
Javier Carrasco
