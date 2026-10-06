Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14193CAE95
	for <brcm80211@lists.linux.dev>; Tue,  6 Oct 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275255; cv=none; b=SECyhvB4N1tm52B0CNVX41aH5/c+0WfmHCVorpSHIQezChX7qRzJZsqoVgInAZ1PaQnvE0rstnrKnXaE9Yi0FYo5yX1QIrNQaI2RrnTt6C+oTBQkhLqQaZP1BhFQWVs6JNdop+hlFfou1GS3nE0JE4ZbiZYy9uSdZnMPogTImBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275255; c=relaxed/simple;
	bh=AhTSB+hX8DW5/UqPj/kPlDv4TilOhsZezix19Q9Y0hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cg1jJOvgihuhXFCqVMMtC7hvq9as7R2YsYANf5j6PBtcg6nxmbiGaN/ObViT8d4tIK/QKbpNM4xoXEdYfbwto/ua1uUCanMe0RIUc1gHnfQ7k2FFF77mn/noQJwglTDG42qzpbT0x1xcMcbthRwLUclI7I1o7t0oVUwwSBBQwY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LFrVVh5X; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LFrVVh5X"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-6768ced47aeso378690d50.1
        for <brcm80211@lists.linux.dev>; Tue, 06 Oct 2026 01:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275253; x=1791880053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aO7ZMNOXH20rZFoB1a96CWPC5jLhbhIpE9Whu53E080=;
        b=GfDLFKGUEh87UYb8o1iAs3rOZ4D5YYcE8zI/JAbsBkTzMnNVqws9bNhdf9+5ub1LRf
         PUkyQY/fxQRK7DSXaCaGwmc2F9dcx/oWd+50OLFgK4QzrjUa5SjcWw+R30Ne2V+MKept
         BIWuMj5GkzJYnJxCDqRjyySaWf77pG1nLbESwmDB2hYXuLHeNEy+lEQZiAQ+/GshBBLL
         XDHA50yUCZMzpIZqrcO/vIUP173W82xsBTFrN5Ws24tnZqQLR+W5Vh/BhZFBx3SeBu+B
         WhRaiBcXGSd9GEBn8ON4uH+F7b6xCCY2MQk4cV8XqRPcg489FepIrrYvk8MV/jTEZ35p
         TBrw==
X-Forwarded-Encrypted: i=1; AKwUvBxo+9tD5IR70/l+IbkHJnfNO7wTYwIges2jXk1bIs9CZRIz2a+0EqS0f1Pa+WYnNJ/a07HOT4Y2QY0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIbEqe1pGyJtlrJEv1BoONg3DsVWlShzNRSnIm5ViMo1sFpB/wD
	I0b3tLLHpc6n2vHAHHfyLorxPJgV7Fp9DP9hW1HPmTPSN195hlrxxXbqS0KWbsQKwgyAnTxIta8
	/pIiSABBmujVIZ3+gGgXT2om+VL+Qbko0iu2cTBEjxMnBIfDK4PRzuVcXQEWPtRtABhPt1K3hV+
	PuHc7NJ1Oc9o6Z8m6vfMqeCQ/8yGqpowAgS2hAzwl3ikOP5nbTRy2oKD4B30UvRCMznWEW4EFsd
	Ki8ikA/RtwqI1dAUE1e+Q==
X-Gm-Gg: AYBFou2K6tXsXujGTxJPlxesYpk05vTNxD2Y59pDa7RZ6TVf3xQA/NtkQPd2cwid1lO
	qxFAS3LDSMsPT4nUymC8hDgn0v8OGzj/f7F8Dr0Ai9gFUNyLKKquyxDBS1ZH/hPo2irsQLK1TNa
	P2qomZZF5phNbZQMz9NtcljJjTNSTpYIy4sTR9q99wm9HwuEeu+g67vNRMWE0W8WqDKTQDiSFw2
	ilkqizb4VDtVXBZqz7VgqNuY/Gz3STkVHSNQ3fXoHz9WTdQXQY+MuMxjevV/i46swLRFXrakMeD
	X231nEXHhZ5SSPIXJ1BBsXdstMLE9K3npkAIXzSMTBl7OyWaAAytEYKUID9sC4P6kElgTZToMQX
	ncRWdf1MRp25q2JmmRonpzPwhLSNEcXrsuLkYnyvM2j1SWJsmMr/vECbiOgtFzAYY7qsBrkTfoY
	p0RWF0Q4LZadJuHmsjqTG7O3O0iARDHn599reLk28=
X-Received: by 2002:a05:690e:1914:b0:677:cf7a:ea97 with SMTP id 956f58d0204a3-678fcf310a6mr281659d50.85.1791275252579;
        Tue, 06 Oct 2026 01:27:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-677c1b6e1b6sm1652812d50.23.2026.10.06.01.27.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:27:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1416f32fe11so4979687c88.0
        for <brcm80211@lists.linux.dev>; Tue, 06 Oct 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791275250; x=1791880050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aO7ZMNOXH20rZFoB1a96CWPC5jLhbhIpE9Whu53E080=;
        b=LFrVVh5XSxB5oZk+ecGMpJAYThsOVHnT+qPg084xNmPtD13vazbWJviaj6s/kMSQZw
         Wcn/exeLzgA4vXfUSfjI7lZyO0/NI8sRhbt4gerUFeESv4Qj3sSVLGcBDQOm7+NF+RUa
         hNdPlB9BW4zEZzXweYgLdJzQ0kIMzNF/OkNAs=
X-Forwarded-Encrypted: i=1; AKwUvBwfNZwJtBwOzpB+OiUr7YN7/qhkw1VhPsOmbdq3kDm0X5P7hY+7is3THub9IiQEZI4UvwzKiVyGTPg=@lists.linux.dev
X-Received: by 2002:a05:7022:288:b0:143:4d12:396d with SMTP id a92af1059eb24-15ec7b02b1dmr978944c88.26.1791275250328;
        Tue, 06 Oct 2026 01:27:30 -0700 (PDT)
X-Received: by 2002:a05:7022:288:b0:143:4d12:396d with SMTP id a92af1059eb24-15ec7b02b1dmr978913c88.26.1791275249521;
        Tue, 06 Oct 2026 01:27:29 -0700 (PDT)
Received: from [10.176.3.41] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d83d6af11sm5335442c88.10.2026.10.06.01.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:27:28 -0700 (PDT)
Message-ID: <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
Date: Tue, 6 Oct 2026 10:27:27 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: avoid sleeping tx locks in netpoll
 context
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-wireless@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, stable@vger.kernel.org
References: <20260930185417.61865-1-kmehltretter@gmail.com>
 <20261004122910.1392318-1-arend.vanspriel@broadcom.com>
 <asR1TaKQJlPFqEvR@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <asR1TaKQJlPFqEvR@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 06/10/2026 06:18, Karl Mehltretter wrote:
> On Sun, Oct 04, 2026 at 05:29:10AM +0100, Arend van Spriel wrote:
>> Is there an opportunity to reuse/refactor brcmf_sdio_prec_enq() rather than
>> adding a separate brcmf_sdio_prec_enq_irqoff() helper? For example, passing
>> a can_evict parameter:
>>
> 
> Thanks for the review!
> 
> Sharing the helper with a can_evict argument is cleaner.
> 
> One queue user does not hold txq_lock: brcmf_fws_bus_txq_cleanup()
> dequeues through brcmu_pktq_pdeq_match().
> 
> Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
> without txq_lock.

This is an observation unrelated to the patch, right? You mentioned in 
the patch it only covers fcmode=0, right?

> I combined the helpers, but kept brcmu_pktq_penq() for normal calls.
Sure.

Regards,
Arend
