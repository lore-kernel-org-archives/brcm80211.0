Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95862257AEC
	for <brcm80211@lists.linux.dev>; Sat, 18 Oct 2025 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760813209; cv=none; b=TFCOkWlq/nM8pZVGyAfbfs63+dTJ6pgLjjRKG3wiFAMvKlaDwiGg8nT07Y/mpNBr1EFCE3YjL9DuhWoWcn1yfaiWJnFssNyPIf3PgPD0QSAVqTmOV9v/C3eogUunl/Ryl+OMNv1WQY67CLqSluuN9moyVK1Pe3XNXdBXsJxPGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760813209; c=relaxed/simple;
	bh=so63KevQGBFjL9THsiWOunsT5D2s0Nr7Jnz3dwCnGzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=hyxQ16bvddyLQocFWCsCp0AdsDKd/18EVBy4Yn+hvQSVBTzEtsLzxiWeIe0iFdnAma1Sa9WJd3zP2A1l8wlyBYPF7aCc0wNEXcTTjU1o7yPFTPDn80uahItt17ARAxNiT7b8/KbpM8GS/0Zm0+bqMSXQ4CWadd1a/vspATiB4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F6PK8uUp; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F6PK8uUp"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-556706ea172so37919e0c.0
        for <brcm80211@lists.linux.dev>; Sat, 18 Oct 2025 11:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760813206; x=1761418006;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JrkmJIXKp7kFfOk4QDLOiZNg8PV8Dbo0hsP+gg8GAyM=;
        b=K+gtYD8xFAI2F1JcI9x/bCbLYG3pcIPHFmJEWQ1nzvxpjFc5lFCJIzcvTR6Oyk5exz
         fXPQINcbJ7ouDifMIiBQpnjPV2RZQ0cZcCapNL3EGZijmrpdqpa02T5HONjM1IvW8yXB
         QRzmh+fVqkfgAcD0tre3fVHkC5ZRXRXm08T38mkLvCak4MvOp0CAB5phRoQOLazBxHlt
         dIX13SBuFZzzuqqSEpdJvU9UAtE1SoAnibitm98hZYkpGr2yryzKbq4UAiC400mbhku/
         y0yEW7GroTSriRC8Uxv/KJmRyRLdRXjY6283ttLMmvxa7W0o/m9MnCv4Ug/mu0CwRNtE
         xAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVuc5CCasexpxm+Rooba0261Wnhc/LDFfqsO+PN9OZpGIS34CQ9Eo+kmIv+yRMNG44Thrfly5oeqvA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+J7/5i2ArDAm4PNekfrrQzbrvpc4+gaMgnHvP6pgO0m/EZF+r
	R/8ZESFXiBqYxDzIcHkJ/AU4+5IwNkViMhG6Oy+L2lHlwF8mfEh5bUBpQzWE1Rj0jFhiZAR7bZY
	+/azTsQC0X4VecUMJLMltzIlP7lgoOPKgGxmcPqcvwGv8UiLA0sClxPo1ipsDM1vexrd4ciJHyn
	vH/DcQ67EqnJTD4O0Pj3S+jBIXQ0qGoHcm62IZhHtuQxTG5jR8o9Jv9dJJi+Sz+L4LvMNwFz7V5
	NjOzzjwg3nxAkK44zttl18/
X-Gm-Gg: ASbGncsxM32YmUzaPmEhIv8Sogb5a7CMm+IbomSqLbBFnyOF6GReODiKtnWLwU55/s9
	nc+kai48yLZPlzhv5mOxTYGEw4gbE8FpIsDy7IRu0+cHKtxP5aVeTifk1NGzbht0lpwt1hAiPnX
	AFodcoV1UP5oQVNjV0k4dwt933tiICuF8fmGZgmfBgGidxHncIlQnNn/FbhSS8Dw1TGWSKGes82
	ZR0MFlpKLXm7NCvZbysn82Ibe9uD7eaVixxwCXjSN1zY1ndIz1ZKk1qyrgj7jg53fxy3OSnKLVl
	j5OS8RpzlaWeYfZPAZsu+iM8MlLr/wjy1md9XdQNxpRuVG+EfAhHg61XLWf5C+vN1KBTZo4sf91
	hRFCOtnOiHUSoehQMHdHHNL4RtQ+ymmjixGH55YveDgKP8PU4F/Mx7c+MJW8IE6E0gEw1f8cgMO
	GkOKOuCnZ4A1UR9kK8hHwy0fxnviUG7oJ+ul31gg==
X-Google-Smtp-Source: AGHT+IEhyJPqE8UYWReqSQXgavDzDaRcQhyh45rWBbx/Q+Qwb4/GoKh3hdDeS7mBSJNk8JXt4OORoSpGfMfl
X-Received: by 2002:a05:6122:d95:b0:54a:8690:7193 with SMTP id 71dfb90a1353d-5564ee82868mr2791485e0c.4.1760813206341;
        Sat, 18 Oct 2025 11:46:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5566203ec14sm431723e0c.4.2025.10.18.11.46.45
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Oct 2025 11:46:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290c2d13a01so20296835ad.0
        for <brcm80211@lists.linux.dev>; Sat, 18 Oct 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760813204; x=1761418004; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JrkmJIXKp7kFfOk4QDLOiZNg8PV8Dbo0hsP+gg8GAyM=;
        b=F6PK8uUpdwB2M9z8mYATQ63yoE/RCOkbRkG1jR+kW2oXPWvpYEJzLtZ3bm3k+f23F5
         Z+gIkh0vyr8T6pKf6nq1V2mL2LvrPjJxb5+LSt/txBxuFhpMJM+MGHumQB+Zz+Gc+Plz
         /58cqVmeMNqgj6Wn3sV2Ww8M9QzAX4STOBNAk=
X-Forwarded-Encrypted: i=1; AJvYcCUU5bVGn5F5gNlYk353z4HUnLIY8U1ONb3d3HKKkxHXPDkb9vuU7ef3v8sAWy/m2+p81aSVwXxQxM4=@lists.linux.dev
X-Received: by 2002:a17:902:f709:b0:266:3f63:3500 with SMTP id d9443c01a7336-29091af39e6mr148833325ad.12.1760813204332;
        Sat, 18 Oct 2025 11:46:44 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:266:3f63:3500 with SMTP id d9443c01a7336-29091af39e6mr148833155ad.12.1760813203923;
        Sat, 18 Oct 2025 11:46:43 -0700 (PDT)
Received: from [10.229.40.87] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df9351fsm3201099a91.16.2025.10.18.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 11:46:43 -0700 (PDT)
Message-ID: <977b67ef-ef6f-4ae4-99db-eeb921a17e3f@broadcom.com>
Date: Sat, 18 Oct 2025 20:46:36 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New test release reload driver
To: Berkem Dincman <berkem.dincman@gmail.com>
References: <CAC3nzgJ9uX3rREGQGbLA+oJMzDh0Bc-Fs5sP1sM_4DGScgq=3w@mail.gmail.com>
Content-Language: en-US
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <CAC3nzgJ9uX3rREGQGbLA+oJMzDh0Bc-Fs5sP1sM_4DGScgq=3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/18/2025 5:38 PM, Berkem Dincman wrote:
> I have PostmarketOS on Pinebook Pro v25.06 it has an 6.6.34 kernel 
> originally I have custom kernels 6.16.7 6.17-rc7 also booting and wifi 
> working 6.18-rc1 sends alot error messages to the screen but works fine 
> if the driver (brcmfmac) is reloaded

Thanks for the feedback. I would be happy to look into the 6.18-rc1 
issue, but you are giving me much to work with. Any kernel logs that 
show the error messages would be a start.

Also please put the mailing lists in Cc: so other people seeing the same 
issue can chime in.

Regards,
Arend
