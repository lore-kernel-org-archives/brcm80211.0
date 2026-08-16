Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B713B58C
	for <brcm80211@lists.linux.dev>; Sun, 16 Aug 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786872453; cv=none; b=Cyb3wOT0Ml9rQ/AEGJTj9okTb0lZc7JJ9nQzmg40J2VO44yTCQdX6/ralRrYoVmtyP3cGjthNtKL4DksoFy53zjD0dzDzx0qJzm0yIRBzY3ZkaF7M02nGEupceI6butzBP/iZMTJCXFv96xyPxkFCDMLr609DKY13GCdqMwDxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786872453; c=relaxed/simple;
	bh=gHaxS2CMGM6ltvdh+vUAj+mhVVXmU1FfTCkmGfYFns0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReQqabKXRxK1ipCaW96cOyA2HkvswqTxyxYnURjWj20K3LEPyXt4lRw2Kb4J7mcwg8ivf97L1ETd4EdYRR84YW0/luwwOnftloN2XXmadlpRKe2a+4EuGvlAQwe8WOOC7TSs1NmCmJ+GfRUsGWGY7/xwqv6YMAgol9yrO2B6hyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y4LituAJ; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y4LituAJ"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-381b831d535so3691676a91.0
        for <brcm80211@lists.linux.dev>; Sun, 16 Aug 2026 02:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786872452; x=1787477252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6J7Zj/2iLPXHmJLANMYAlHCnCm6alEEBJz8C1vVMkgk=;
        b=iNvdqPr9zJrfqVixeR+3BEmJIpQsd4JTL4+CJ71u/ojVa9DvPfLcrU10SNtl6h2jXM
         KHIyj4oIgYBirj84djBB3bQhE1h6TI4mELDY5CykDFDWVDLVTLDi11Zg1Kb+9rrEmqjn
         UuGyS4fkpV0KzT3Gks6Osyat/8Nc2RzM5aGVtb9V5DlUHUQMjaMOgFhd+6s14BoqwXEA
         /G4p2mlkg4ObI0eQrC0X19ipXOqanwmILSgeqTyfye9j6p+3jRsS9XAiFm1IWX8z38Xo
         qtuBXe5TNFp4KfN59OPoskt38jEAQqej3JwJ08ca0wbz2S9xf6Kp2oQv76yOTNMc7to5
         NC4Q==
X-Gm-Message-State: AOJu0Yyv1wgxKR0G8bOueFFySg0CXYLAU6GfVDQ2DbPPBchcFm/oPmha
	2QcNCtuwl4UVctzf8gsxdT58WkZOHkASJF1sBjXM+Yxat9j5ETqovDgjc+RBMab4c6v7YjjklqZ
	t80ni+YFjDyZHU1PlS9hVMVkAZGnkg/tou0HurcCaDTMiBmb0U2BQegGeNmXh7tNBxsKi4Tbbe1
	p1g4mXoRnsV5hZK+msXTInKZ7IjWCuFkjLJ53VurQuu78YBjW+muxjXbG9Q5W0cXrDazAcK0c2b
	CD89nkaRaiUDlx72v+9Qw==
X-Gm-Gg: AR+sD12BGmjVmwVNyzLbTgdrinUko/Q8LU0vKdqTf43HUdBq2izSrbgZFmmQmj/TQnS
	/C+mZRq42a+nOXYEWYEjtUQu3k23neYJTzABXLPl06I0kI9Q5GaI9J7vg4NtF9vNxwuzt5lJSRu
	CYpB7Y5giZfQjuBpaNmDHWoqFcugyE5/0NCEDHspdDdjYX0IOEuv2bH9L2JOywvRZOpnHl/oqrI
	jGcXa5OZ6Fis04V3P8p7lLY/nyuMnKsp/LD7XS2zHyZ4NsSpu60FuybTI7Iq7MR633N01FG2i4w
	rTa4gLmVGf2oKzTdyKGE326UqgkP9uiWOaN0HO+/8zaatIvRBC6fmZXgDX8eaVdg7A5GYjieSOT
	NA4w0YTq8vnI8aBpscAtKOTWjemJVV0/183b+Of7Me6uksMLcWH5S1GmktM9KixINdLNWTvv1bu
	m7iKnySSGFXlE0153Frcz7qkRURNKGixV/anS2d18=
X-Received: by 2002:a17:90a:ec83:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3933b8c1041mr19085600a91.16.1786872451770;
        Sun, 16 Aug 2026 02:27:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39531c3b13bsm567500a91.0.2026.08.16.02.27.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2026 02:27:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso46614705ad.3
        for <brcm80211@lists.linux.dev>; Sun, 16 Aug 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786872450; x=1787477250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6J7Zj/2iLPXHmJLANMYAlHCnCm6alEEBJz8C1vVMkgk=;
        b=Y4LituAJIJKM++XlK3fHfi10O7TO60O48NdDDaZ5fnrGplc2LsdcFsZGoXljN/BYpu
         0aB8vIi1vpXJSWhiBl83oSu7MOqRzvXO8UL8yuUl0y45guM+m/WBAwJhcpfnvmU4vh8M
         UNnA0e2v8yXUz6K/Zf09E/03GDuyTuLTZvWDQ=
X-Received: by 2002:a05:6a21:3384:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cc719c7356mr23248610637.7.1786872450057;
        Sun, 16 Aug 2026 02:27:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:3384:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cc719c7356mr23248589637.7.1786872449629;
        Sun, 16 Aug 2026 02:27:29 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm29196000c88.7.2026.08.16.02.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 02:27:29 -0700 (PDT)
Message-ID: <999f6e0e-8706-479e-a861-be83fb022a62@broadcom.com>
Date: Sun, 16 Aug 2026 11:27:23 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: allow opting into PM_MAX
 power management
To: Alexander Fischer <alexander@fischermail.me>,
 linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, Andre Eikmeyer <dev@deq.rocks>
References: <20260810150552.25375-1-alexander@fischermail.me>
 <20260814205115.799977-1-alexander@fischermail.me>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260814205115.799977-1-alexander@fischermail.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 14/08/2026 22:51, Alexander Fischer wrote:
> Hello,
> 
> I would like to withdraw this patch.
> 
> Further testing on BCM4364 showed intermittent latency spikes of about
> 50-250 ms with PM_MAX. The connection can work normally for extended
> periods, but the issue is reproducible and disappears after switching
> back to PM_FAST. This invalidates my earlier statement that I had
> observed no latency regression.

At least thanks for testing.
> Given this trade-off, I no longer think exposing PM_MAX through this new
> module parameter is worthwhile, and I do not plan to send a v2. Please
> drop the patch.

Agree.

> pw-bot: changes-requested
> 
> Sorry for the noise, and thanks for your time.
No problem. Had only glanced at the patch so far. I did have my doubts 
about your latency statement, but not fired up my setup with it.

Regards,
Arend
