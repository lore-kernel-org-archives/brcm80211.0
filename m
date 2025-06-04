Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F30932C85
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056779; cv=none; b=Tkwl2G6Z3WLcCEzNn888dh4+WTWQc/EnAucjZRwTwNPOtG2Z3sw+OjEpuIdNTamQv3FLUwkbTrR2aPpo5E9zaLUAuCqx7UMREqB2ZeaADsAQPuugGkdFF+4smr9jy/fNup2+ZEwErbDD2HHjJPGrZGfxu92rMynGoRy7UFv7gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056779; c=relaxed/simple;
	bh=PRGdbARxfQzfSEDkl+PRXI6qG+AN1CcFGLsAJiGGrYw=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=WH+LZlI4UNaeRpSsi3e2AhyQCBZ0VvqrVemaNXNHgu+aWnU9PNy1UVzAZWj+hJxvGnR2oZLMJfHsMLdQq1a8+qZW4B4PotLxjbrT80Fw86nEQ7Xskb52Tzl7st558XdRaYE4TZAJ6Ot0wuNEcLQP6QMLp4sZTjxuyMGD7SfiLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZFR6JQD7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZFR6JQD7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fba9f962so132221b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749056777; x=1749661577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbEnrPzCI5WejU+0SdRvZf2ZzqsgozVyn56DobY48/8=;
        b=ZFR6JQD7rkEnwqDnpNUQn9y4BNc1h5S4rDvySLf5sy7pdLu/w860FHn91OghPNVM8j
         jWBFNM0gzae5UR8Sl9Kz5aHCn5Opwut7Qb8d+6MS/RWcRTgymntMb+DG9lDTR+rInXNz
         fNyJT2HrZv8J65fGGTEGSoZo2R3G6EA33IAFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056777; x=1749661577;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbEnrPzCI5WejU+0SdRvZf2ZzqsgozVyn56DobY48/8=;
        b=ER9YGlbbsObU9unBbtYgHiag6JKPNlPCY1CeMI7Yi485vAtWp76mW3ua+fBydxFMEF
         +17fTQQJi33bn8XUS+mFq9NkcoPpalqkOB8ryJIQUB67rggsTdAo+tZVPW9RelkXrA6l
         h05UHqVKyG0M5n2RoKWClDyKUy5v5SfH2S4J5kdXTjpjYUWuUgDRpxswWmMD2oBJZ7jJ
         new++VkjDGt06IiTrA69FLnv5HBT1KZjBRbp15e2AiwhZC5E54dOPXfpynzYk/Q70dEF
         0A0926qvvszMeO2VGuDQ64HUQ+R2kATpvFS0vr3gCvi8LBxMoVJPyWODZdYPMEdvGoK4
         veCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYrgbDFjS+o+cRQ2fuac0CAZZ6UK5YJ/QR8mc/fCf5NUwv36bVrxoHC+MQrPEHWx2tiV2ZsUoRWIE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQxVnaHYjuqXJ2zmcZJs7kPplYaKVrUhcA9Bgl+daGo1/+5fmn
	PsKrE88qFcq0XUlOIlV3kc86BM56ouNyEGCi782Pnjebcj1hO0nOnrz5l50MWs797bPX9reUpm/
	qY6TaaA==
X-Gm-Gg: ASbGncsbdsORQ39lb09YpKzPrbp9+ym2hhoF23pcZMEiSjEcXmN7ZJCNll/v3cpodQI
	eGXpjc+KxEXTBDHQf6ffwKWUgVzuOsRqF1drF+NoiXIq49WXEqXW2W1+ErPYrd8bCtEdo6AuByl
	Asz0lVM89/hbGhvGnZmYd/STf6SXaiPwce+Zpv+qWuIf95UkfV7OoCTga4YjoChK5VvR4p1Sc7U
	24XorBwpwM427QcQwzQE+hoRmAW5BhF6G485CutIoVf0Knf3jrzyV+RKeSTpnFEMUSDao6w0dKN
	2qE1CgF9alZVEk93WeJ/SWSiIVSpLe7ERbZ/1hEpy4HJQUBLSnqT2W9G3bG/KUelSvqUYLHDwiI
	GP2AW38ZtpDRnfVYrJ5IakLk=
X-Google-Smtp-Source: AGHT+IEguPa4VugXAsNDBmdovReStS2oaZ1pYZT0PiLzM5fKveXPrubNL7gM+t9JY8D8yzDsbId3sw==
X-Received: by 2002:a05:6a00:2ea5:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74818365934mr342803b3a.2.1749056777276;
        Wed, 04 Jun 2025 10:06:17 -0700 (PDT)
Received: from [10.229.40.11] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41d7sm11368080b3a.123.2025.06.04.10.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 10:06:16 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Wed, 04 Jun 2025 19:06:13 +0200
Message-ID: <1973be85b88.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <966fffd8-1ff4-4a29-a0a7-fd081a12dd45@oss.qualcomm.com>
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
 <20250604085539.2803896-4-arend.vanspriel@broadcom.com>
 <966fffd8-1ff4-4a29-a0a7-fd081a12dd45@oss.qualcomm.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [RFC 3/4] wifi: nl80211: strict checking attributes for NL80211_CMD_SET_BSS
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 4, 2025 4:24:43 PM Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:

> On 6/4/2025 1:55 AM, Arend van Spriel wrote:
>> * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
>> - * which indicates which BSS parameters can be modified.
>> + * which indicates which BSS parameters can be modified. The attribute can
>> + * also be used as flag attribute by user-space in %NL80211_CMD_SET_BSS to
>> + * indicate that it wants strict checking on the BSS parameters to be
>> + * modified.
>
> again yuck that this attribute id is a nest in one usage but a flag in another
> usage :(

Here one usage is from userspace to kernel and the other from kernel to 
userspace so with proper API documentation those two can coexist with 
special handling or policy.

Regards,
Arend


