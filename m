Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5E49659
	for <brcm80211@lists.linux.dev>; Sat,  3 Aug 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722692839; cv=none; b=q1HlCu9VhZOyHGV4s3CKvU1tXmI9i1IAFkHc8DXxd0DFAVh9R6tJ7TYetFgFqzIassALv9esvvMAM0e96x90qPYh86BADWJXzdzRTfrxCMNcitjHZzogV9k28LhFvQpAaXOeNxWQh1EIu7Q+04xPBoeTK7S/TXS57MtVagkDDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722692839; c=relaxed/simple;
	bh=NYA6sYQwjyHrZaAyGTauiIPxEqDC/y2kBfxFAb1PwZY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZgSnPknyIagYx/lpo3t7PdpCAYbUF8ztxHWDFSTGWplf9FttbY4KDiTHF7qhZ/dDwl0ITIV9e7uwXyv7hdu7cLPc7poS2t0/Hs8fl3l3O7teFNgrMN0sp7B/xJTSVOt6zOVh0WI+SC3FVh4lVSFbY5MUnWoMbNoStZYVOQBuEFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KuTeLuAP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KuTeLuAP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5b391c8abd7so8646539a12.2
        for <brcm80211@lists.linux.dev>; Sat, 03 Aug 2024 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1722692836; x=1723297636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5RT1Qu2F1uakgzsI7iEt4bY0NeXn3F9JOiq2sORjJM=;
        b=KuTeLuAPCGMnR+LjdIMeo+UQfHiKkbE8ePdJLtWZ0nVHakHBQLK0W/yRHc2obyZvEQ
         c2RB5DRYSfCBP6BryZ/vbsBZxCW3SztL6AYJ48Y79OyvfcIVTu0lvh+T+tZXZjFjk53r
         +iBJgX6FhLbIeCw194Fan2gZBPBu0wEurLnNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722692836; x=1723297636;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5RT1Qu2F1uakgzsI7iEt4bY0NeXn3F9JOiq2sORjJM=;
        b=o9un1CDdo5gFSZvUKAMd84H84AbC/gV5I8puv5vbQWGf6TmoybCaafgqssiSkKDif3
         ukKuuE89Wf5pbBGXWH4ADKWVr2ODeDWKY3VWXNkCwVNqx5Pdzth3i4/7xvg8cexs6q09
         CxaoFN06h9xrOMBhdggsUU8MYvNTZTu/Kx6+Df1O277ckIeROVLnvcw7tkcLdBARpR6Y
         S+KNjEhRseOdaPBXK9w8NzWYniRxerl1gJII5ooN1N1WaOX6e0c3IXRdlAxJLIJ+YFgv
         Dv1GfU5YcAB++jvhsNwJqwl+UABlumHAbDEfclcoO5a6smQyfjGeaDZuy47osSHiAWxL
         cQtw==
X-Forwarded-Encrypted: i=1; AJvYcCUethrfhJfXjbOWGvoIZam6ERSLx0KKL51gPhbDdgmby7qrR/6HQp4nOtgZ2gX3kozugWwTK8lwGWTKZKuUoE38RroP3FFKNyPD
X-Gm-Message-State: AOJu0YxIF7+v88omd7GVKdTJ5MIjDzDym6mdjlBH0HgjjdeKgoVwsCrM
	sYpW3F3htiSAt5Fiqo4XQnbpRIehaXSZM9ND02xLa6i6DeMK9bIh2wYr9MKzLQ==
X-Google-Smtp-Source: AGHT+IH5sxguhxTGPtrzWoIPbbAkQ7FJ4XYNcIEzg1Fzyecpd8e+DAtDtrRTDth4ddyzyAeWlhJzrw==
X-Received: by 2002:aa7:d5c1:0:b0:5a2:189:6306 with SMTP id 4fb4d7f45d1cf-5b7f40a71c3mr4958811a12.18.1722692835699;
        Sat, 03 Aug 2024 06:47:15 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839c2dbe8sm2389737a12.37.2024.08.03.06.47.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Aug 2024 06:47:15 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jacobe Zang <jacobe.zang@wesion.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, Ondrej Jirman <megi@xff.cz>
Date: Sat, 03 Aug 2024 15:47:15 +0200
Message-ID: <191187e96b8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <f2cc346e-63b0-4fb7-b954-5dc3e597b7e1@broadcom.com>
References: <20240802083400.166753-1-arend.vanspriel@broadcom.com>
 <f2cc346e-63b0-4fb7-b954-5dc3e597b7e1@broadcom.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [RFT] wifi: brcmfmac: Add optional lpo clock enable support
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 2, 2024 7:28:51 PM Florian Fainelli 
<florian.fainelli@broadcom.com> wrote:

> On 8/2/24 01:34, Arend van Spriel wrote:
>> From: Jacobe Zang <jacobe.zang@wesion.com>
>>
>> WiFi modules often require 32kHz clock to function. Add support to
>> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
>> to the top of brcmf_of_probe
>>
>> Co-developed-by: Ondrej Jirman <megi@xff.cz>
>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
>> [arend: handle -EPROBE_DEFER scenario]
>> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>
> This looks fine for a cold boot case, how about handling suspend/resume
> where the clock might have been disabled, do we need to deal with an
> "always-on" Device Tree property as well as whether the device is
> enabled for wake-up or not?

Thanks, Florian

When the external LPO is disabled the chip will fallback on the internal (I 
think). So it is not an issue for wakeup scenario, but if the clock is not 
enabled upon resume we should deal with it. Could go in separate patch.

I can inquire about my assumption above.

Regards,
Arend



