Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290E4B5C1
	for <brcm80211@lists.linux.dev>; Wed, 21 Aug 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724225384; cv=none; b=MEfBEfHeC/BkeCvr9rMgysBKY4rAqH7yTRxRVRGWmZES8WIhFJbzc7jBNvL1Mp8y5zS773hOakgSnlif21RxvYlvqNvlOSRWc6IdKKgkH7pzb/neZ6kogmk8yJBKrWeha/fy8BE3LvjLMaSmrsuResn7KTWTXni5iyq04iS+s+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724225384; c=relaxed/simple;
	bh=CXsMjHtViyxnXvurkLsmDZhKvM+hxio+5Y21oNTilug=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ExRqOK+n1XbAxSwYcTK69JFOmk6ODu24r47bmmXwL9JgK8c98qN+USd85jWcjuaGkD1AnDmxoR7vEvMpzz+T+DoMMcj5mc4WypaR9cDQo/+V0BsFGzCAZJHlVq52ITeULYkQA3bGImHydHqHPQzTq8B3afgSAOWLyddh+PcL2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V15seDIZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V15seDIZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7aa086b077so658719066b.0
        for <brcm80211@lists.linux.dev>; Wed, 21 Aug 2024 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724225381; x=1724830181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LViZ5W//qjT0bseWlRdDR+ofHchDTbNOWpLQNl1QIyI=;
        b=V15seDIZpmC2ZVog9dgHxzfp74AlWwAzqkn7qBSS8rPmfEAHxE684Xmnf3GoSBW8K/
         xVnA6i6NKUHj+nXwtpbI1yLzf2QSEqB39Ed0HAqOioDDB5YgLEn4Wtu0f7EN5EzLiBad
         GFxmfpr2gK9KBOZ53gnM5XoYeWBlNVjF0B6Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724225381; x=1724830181;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LViZ5W//qjT0bseWlRdDR+ofHchDTbNOWpLQNl1QIyI=;
        b=GseSXqRADteB+zBsgC+tFBIjARsM1rJO6XicCiSW9U2tSKAFIJULW5T5xCpwWWMdoN
         vaVvwlHBBT3voKzMLFV1w5QPRU7ifcQJoT2EfkXGZBwe86pF2RiahR6nfnHFEJzcCeO3
         0rokNN0811IbOWJfWtOZ6oq98u/KVF7mEPFx30VfOFwwD6LZ3dDotHDzXRBcwmCWKQXU
         dB1KzJ5gEVYJfb/sMB35+I1Xju5emlmYJZcelTtUO+i7GE54pBPRWoxKWEOZMpIO9/MN
         JC7/YGsMsj8J1b71KSU2VW+TKp43p/rOgRszBQZSo/TP63hGhDwmehnUC+eyDaGjLcRB
         zvYg==
X-Forwarded-Encrypted: i=1; AJvYcCVpWjOpCzEo+kk4KKEQzvRymhNLj2qVeaasqYAukdqlekOaaBYiYEOzcv6DCKgLTIVeBQ7NWwt6rhk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvNOchnRP6tHygYZRWAGpPuSAMyn5RvC1CoELBKIj9M8P6xRLL
	ypdIOJde8WsxxAH6A3hk8J/VZX7LSSIPMR6aAu0cY//N6mu875OlyM6Kl5B6BA==
X-Google-Smtp-Source: AGHT+IGKn74dxV2xpiUd9ElOKk0FOMWO4jT/VEVtlz36cLm+Fq+nLXczxRXRbPVXS8a8j/ROdHSd5w==
X-Received: by 2002:a17:906:cac8:b0:a7d:a0d0:f5c1 with SMTP id a640c23a62f3a-a866f9d965bmr97484166b.65.1724225380332;
        Wed, 21 Aug 2024 00:29:40 -0700 (PDT)
Received: from [10.195.133.28] ([109.37.145.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396e0edsm856400466b.222.2024.08.21.00.29.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2024 00:29:39 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, <kvalo@kernel.org>, <johannes.berg@intel.com>, <miriam.rachel.korenblit@intel.com>, <erick.archer@outlook.com>, <emmanuel.grumbach@intel.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Wed, 21 Aug 2024 09:29:39 +0200
Message-ID: <19173d75ab8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20240821070257.2298559-1-ruanjinjie@huawei.com>
References: <20240821070257.2298559-1-ruanjinjie@huawei.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH -next v2] wifi: brcmsmac: Use kvmemdup to simplify the code
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 21, 2024 8:55:44 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.
>
> No functional change.

Thanks

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Update the commit subject.
> - Remove goto lablel and retun -ENOMEM instead.
> ---
> .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)



