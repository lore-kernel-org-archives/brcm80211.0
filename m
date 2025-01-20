Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB84438B
	for <brcm80211@lists.linux.dev>; Mon, 20 Jan 2025 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737394569; cv=none; b=hpG5CVIRvmjeJfZEcMA+ZVzLyLByZ4rvG4g2HZTwwdW7kDVByrSXw54KMp5HC9IHXxbgw8JjrGpG8dxKHvajhTwfVGo4el8ltpHTBoWr4ibkIynggfL3YKYOkCAUqsAMamlPFc1kHnQ6SES3P+TjDVSyhOF15gZh1r7fu1epfPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737394569; c=relaxed/simple;
	bh=OWjCs7c3Z3OCyI44BJJJ8m95UEV9C/WJxLxyxMRcTSg=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ojdEZe9C2HcJgqHjmSEwtzS8KPJtxWZwznm34NB35+bc22MhedG9WOAMhv+uhpPsxG//qBq+h+0MTqQPaJI2xRJLgVD+boluktoNjgm4HqjOdK6PFl1eINWRWuGqPZQqNPWdxWsdNE6uIDjSm0lSmoxqp1XqUxe41WxvOg7IkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NQDnqBx/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NQDnqBx/"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso7165328a12.3
        for <brcm80211@lists.linux.dev>; Mon, 20 Jan 2025 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737394566; x=1737999366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvc2Rz1m9N2wS2uwg8ORhL6LSIX/Tdz2W8B7SCeMhIs=;
        b=NQDnqBx/51BGFa1XkhUtkFoMULeeOcxTIPKoyIlWwnyIfUdNIp7J8w6XzMB3zIXjJF
         YSHqZqwIobTMT0/Fk3AT5xldk0gnsGVBrwvCNPo6j1PVbrLhzmJcevBF3/7p6iK1tOkf
         i+58sLANK1hiB1ZdgEi1VUAHAtJgpsTe2DjWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394566; x=1737999366;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvc2Rz1m9N2wS2uwg8ORhL6LSIX/Tdz2W8B7SCeMhIs=;
        b=FDqbY7YWcdONIzammVW2/B2AjC6qhgNj5sD4WtdF6N56/T8wBmhSmYn5TzytLmlDJw
         7739Se7UAKeq0kYR/lNayqn344JUCWZmbR08zW3utmG5Fsu5dtLLo8A6dmHHYL+5sSzk
         SVmZuuVesLkhIdvo5N3D03Kt7O2hz3gCOA8Db5ntSXsz3UoR+K351SGOK8xcLswaD3+1
         3NYfFi7BBxpmj5GeVXxvDUr6myh0KaDmZGWXDbotJpNCXVol4tmKYzuuAhqN35Br7kxG
         v2ffBv+GDyKz8cjZmC+bIzl8O9qHdf06yYuP4kdNrjtl3phw7ff7a0J1gW5b3YuT2EKm
         sxrg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4q2pda41H8jjs5mj3dzbMV+EOszakSAEQcgd9T10XQvaHCG8OVK3KuWTMg3dDinfY0FaPRlZQ4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXymigWsUP8TKp+XN9CCVvpRSvrPVAskudIneftZTPwRgzYMOk
	K/ShtVR6GowMQTLtbyukjAR+eLpfqmx2iTRS0/gtEBK+naqnizVUgDgZIaNVAw==
X-Gm-Gg: ASbGncvxP2EBc/pzfEYtQVhZijKLY0mXw/Bt2z5KFKkgPP8B4mmcw8iVSvUAFw9P4Ib
	xEeJWNIWNjRQkJESEMQZXOTjgX87poxSpi/id4uhxvW4UuUHF0ZIxRY3jaZerlSBUv6TJj8QTAt
	d0dSmctsK/C0IQYV1D8gRbvFj3hhTfxITyEiZfN9I0sDtAC97s6LP8a0I4diyWbr19L9wRGJIpx
	JQ3Jogq/v5JeqZbmdhLlsQLAveJwOtN0iUXCqynaDW1NQh13TowXMVt/pFfNXHMk2VCrNmeU41J
	KaVieYvfYnHQE+WR/jDm1aOhs2YTDVAk
X-Google-Smtp-Source: AGHT+IG/GC+9Wg4EHK7qW88A9verjSDjN9AnXNYY3WDTI+/nRQs9bdq159c3rac7fk9Bt77tDBIoSQ==
X-Received: by 2002:a05:6402:34d2:b0:5d0:e410:468b with SMTP id 4fb4d7f45d1cf-5db7d2e3c09mr11110000a12.2.1737394565880;
        Mon, 20 Jan 2025 09:36:05 -0800 (PST)
Received: from [192.168.178.74] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73684dd3sm5955145a12.46.2025.01.20.09.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 09:36:05 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <gargaditya08@live.com>, Arend van Spriel <aspriel@gmail.com>, Kalle Valo <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, <stable@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Mon, 20 Jan 2025 18:36:03 +0100
Message-ID: <19484c927b8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <47E43F07-E11D-478C-86D4-23627154AC7C@live.com>
References: <47E43F07-E11D-478C-86D4-23627154AC7C@live.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] wifi: brcmfmac: use random seed flag for BCM4355 and BCM4364 firmware
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On January 20, 2025 5:50:56 PM Aditya Garg <gargaditya08@live.com> wrote:

> From: Aditya Garg <gargaditya08@live.com>
>
> Before 6.13, random seed to the firmware was given based on the logic
> whether the device had valid OTP or not, and such devices were found
> mainly on the T2 and Apple Silicon Macs. In 6.13, the logic was changed,
> and the device table was used for this purpose, so as to cover the special
> case of BCM43752 chip.
>
> During the transition, the device table for BCM4364 and BCM4355 Wi-Fi chips
> which had valid OTP was not modified, thus breaking Wi-Fi on these devices.
> This patch adds does the necessary changes, similar to the ones done for
> other chips.
>
> Fixes: ea11a89c3ac6 ("wifi: brcmfmac: add flag for random seed during 
> firmware download")
> Cc: stable@vger.kernel.org

Acked-by: Arend van Spriel  <arend.vanspriel@broadcom.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)


