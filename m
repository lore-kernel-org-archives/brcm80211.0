Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA34DDB43
	for <brcm80211@lists.linux.dev>; Fri,  9 Oct 2026 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546384; cv=none; b=DHj64nywMYPsEg8LXLel+e8H28O4M6Ov2NfNy/jm+gR9RdNADtHM29BK2QMjluD7WRzXS+gBcD5dJs51SohDHiDnvKCH+9zBRlyg/d4HQ0ImxGt1bz6ULMkWJFLdSobCaj0Y+IdsUXU7uzc+vYbjdjqyOTlmP2gNsbr5n2ndYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546384; c=relaxed/simple;
	bh=qfn6Chi3zQPoGrRKHUmzBsOFSj22hZyuE74D1Bo2Iiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDEHF688bWcjcwRvKU6MTb1x6nZfT2RyUtxPFefJqveTjYwnjAEBJmn0SDOcleHog61noN0EDmPKLKleoSuM84LXuCzQRwiL/LINwwCv6SzMO03ZtXpqlFZHTbjsjPIefw9b7XjDnjR5a+NkvT8VxibGHoLqiPPW2t04/VsIVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Si9QQfsL; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Si9QQfsL"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8ab8d96d02aso41990077b3.1
        for <brcm80211@lists.linux.dev>; Fri, 09 Oct 2026 04:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546376; x=1792151176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BQ6/HQ3rrLrwxJjtL2d0lIbMN8Q2NnassUE+UKdIN9s=;
        b=y2FSfYBOM1jBZ1Y2Eb3Rto108nSFqFPZ0G0xJmsa/vt9Be9qEnjJI2qVSTwukRobN+
         JVnCmE6RXFcRSOV1vtLi1Mb+USYrq8hAYpFAz0mBAy7bZ3T492CbP3bibvQa+0JrCX/c
         qMxUfhGBwdcCQlCxHcTAV4wSqswjU0qK1kvdLi0+rBfd7GI0djspyU46vFB4nggVxLq9
         jkXCq2FmpnvDgHiWMz4msoXtsf/F2F5ODhWs8F4lEN74plscYs4OVYM6hx9OcUO/rhjZ
         jwA54yvjQv4Vy8WNLfjd1kTC2yQH6v1/1StMyLlTWBfkV0kuWhVoFrO1YG/5gmkvcTmv
         xpPg==
X-Forwarded-Encrypted: i=1; AKwUvBxexTWQutljKuljvMnqiL+jiBrdxWG0W02HI9x78qrLx7sSjDYSIiCs2rlX8mY2iBrF/wErinBsmCc=@lists.linux.dev
X-Gm-Message-State: AFq9FYI3VvfFmBulm28tmJWAeppZwZeZN/rzf0BkKH1YdqjtJV0+n5fO
	YLe9oyfQBC/Ix4jU4VeUuTGZRBou/icoFCyOKrAGEKD6NDIBcD6H2Y1reD31lBWqMfgy39O2EiY
	z+4s1Fh7QkxzRDsgliuLlE+VeqxL2gUcoz/tUJkLIBEbRnxwPErQkebdIvd2CPlxBpbdt1/wrRX
	C0qV8XU+9WTJkn7OqmO77aC35l9nYaCbBmbEkY0zmMvbacZD0+dFowkxx2ShWc06TmUZXn1mdBN
	vHG+Rvx8nRBqomdlLdKVw==
X-Gm-Gg: AYBFou1D22jr5ihrHquqBAiJikNOUKOH7DVKtUEnfEks1hpSbLKyEDjkre/6Y9jXWqi
	8jJl7eJVfiOQImVewFfzBLHwWSvIY5ag9BPycPkUGGLM2LYYrKtJJ5vLtnKO81AbyAKzdC+QdIY
	0W4aRJGgoTaQ8z0oNQnHLbczQLok4oiPM1cKDOE8mQce3V4v6AQDXSWlNDXwOz/yVSbhzsWZgvz
	yaSB53JeHJAhulO1kmh1AsWO29FeYBmuYUlyj2PQpKEhQnVzILBMx5k0l4Dd4Ecakpcc00k1vHn
	U2hvOsorCghl6NLn0vD1fYX9UsAw1ezVPL0o7kfDafitZQXkxkHYLlKbADmAg+Bqb0CmHclbLPr
	bUQR35nNpIJll8s/bkl6mgF9IT8uwolkLh0B8X9Bd3k1HlCBizQYoGarNhMChDYa8npLx/tkdaY
	WabTEeIdB+BUnwFswHbns4U4h5rJ5ktdrO8jwpx+e5rw==
X-Received: by 2002:a05:690e:4506:10b0:677:c489:8f5b with SMTP id 956f58d0204a3-6793602f44bmr362773d50.47.1791546375613;
        Fri, 09 Oct 2026 04:46:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67935622fe0sm88729d50.9.2026.10.09.04.46.15
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:46:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso12131728eec.0
        for <brcm80211@lists.linux.dev>; Fri, 09 Oct 2026 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791546374; x=1792151174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQ6/HQ3rrLrwxJjtL2d0lIbMN8Q2NnassUE+UKdIN9s=;
        b=Si9QQfsL0UE4A28EIDy/cOyBCN68yBIzqt7rYpJhXEa5SI9aCClAl6LTUBRq4gfk/y
         wEnppL4q12XWiAqb+bLNxGZ70WxVhHSJ9THd54KmfQMuWd0PgKeiYNGKaM0B1Eue0J/j
         WAn2WhoRqqDORjeB2WrVrGV2G9kHE8sakfvuE=
X-Forwarded-Encrypted: i=1; AKwUvBwqVF3dhOSVj7kxX9OMYAgbXfKuYFCIB0y4M17Z5PqleYZ78s5+w169IDCJc7vc3y8nFaP+1udCtcE=@lists.linux.dev
X-Received: by 2002:a05:701b:4583:20b0:151:ece6:b171 with SMTP id a92af1059eb24-16a5dcf6262mr2016599c88.14.1791546374231;
        Fri, 09 Oct 2026 04:46:14 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:20b0:151:ece6:b171 with SMTP id a92af1059eb24-16a5dcf6262mr2016563c88.14.1791546373450;
        Fri, 09 Oct 2026 04:46:13 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm9791902c88.18.2026.10.09.04.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:46:12 -0700 (PDT)
Message-ID: <448913a7-809f-4ecb-89cc-3aa3bde08c5c@broadcom.com>
Date: Fri, 9 Oct 2026 13:46:06 +0200
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
 <802a092a-314a-4f77-aa1d-134b3d020069@broadcom.com>
 <asiX75kRueyFqWuO@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <asiX75kRueyFqWuO@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 09/10/2026 09:30, Karl Mehltretter wrote:
> On Tue, Oct 06, 2026 at 10:27:27AM +0100, Arend van Spriel wrote:
>>>
>>> Lockdep instrumentation in fcmode=1 and 2 confirmed that cleanup enters
>>> without txq_lock.
>>
>> This is an observation unrelated to the patch, right? You mentioned in the
>> patch it only covers fcmode=0, right?
>>
> 
> Yes, the cleanup observation is unrelated to the fcmode=0 fix. I
> mentioned it to explain why I kept brcmu_pktq_penq() for normal calls.
> 
> I'm looking at a separate brcmfmac FWS-path RT/netpoll fix for modes
> 1 and 2. The prototype defers IRQ-disabled transmit to the FWS worker.
> 
> Are modes 1 and 2 used or recommended on SDIO devices? That would
> help me prioritise the follow-up.
To be honest I ported the whole shenanigan to brcmfmac, but I do not 
recall any projects used the functionality in production. It is mainly 
intended for SDIO devices.

Regards,
Arend
