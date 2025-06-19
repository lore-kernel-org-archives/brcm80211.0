Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AEA2253E4
	for <brcm80211@lists.linux.dev>; Thu, 19 Jun 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344602; cv=none; b=fHkCqAd+bjeVcr4+HzmSPl5qXo7/N6rKugTK2zWVquxsbcucI2QggZ7vt8XSxq8VLaqauuVW3UMaU/ADxZFiZ9tLPpaiCZNWFLoD+Og1HOk7NDw1iH+tA58KfEED5p3UAwZzk60RUqypO9jqxBrYnkjJcFkxIp0BdxAFCkzmSZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344602; c=relaxed/simple;
	bh=RmY0Xevw8TVnFstaNyUj2eJowpNdXKcRW6wC6tdkF2E=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QBjcrLaq4LLGIijsIGpDD1DIxa366mog7Te+9IbX/ryJNEUAVmL6fE2kZYzHXog5mTHClwnY4YyzELWPu1ciK8KubTK/jgrZHUBwvn7fKrTCv7sl1EjKjxUsldkOt8uKU50MsRizecSzWDSL4zBWu7xZe8YFhOodZpVXkJynIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HloUlwoO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HloUlwoO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742caef5896so641930b3a.3
        for <brcm80211@lists.linux.dev>; Thu, 19 Jun 2025 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750344600; x=1750949400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=HloUlwoOe7N6Qritmklr86myRn5qGhQA7gXf3G4lh+V5xCD9uJ20vwJ16L5hPFE3Sx
         DPwYv8txk5Dy4D7BtvVgRGl/V6Lhfq2wZzoDpMkIBdqFM6Q66ZaozTevtG/iwNA/uJEI
         8bNx8bWivx5eqZot0Vm9ouLNDBfxnf3lOM25w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344600; x=1750949400;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=Fih2SwRw3N5cM1JXHUhhjarSXHVek8tv203CX40hTfIz14/yZtx3TYzXNr7aQYmHO/
         x7h+LdV3uqJgrqPqYPeUQzbScEArIpddalpWAoQof6AhxnrEZpwLCBFdVlZ3O0pJsor2
         /s/IMSpFl2GhVOuAWKCXVREKTU3iKPtli9fITsndqqzfI08N7kcdw3u4A9RRM7WRCuzi
         86oczSkQx+jrTvmmqM0d8WGnFIob+U9h3neK85jZwlab8vMSUvU3jeAs7MuFh7vQvSM3
         tz0xT/OI5O6cZ7Wi809LSnFB1NfuASKdBhH6awVYSajd1F9HzMtADoFGD/f2cnU0ak/v
         5NYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSSDyb3DSg1O6I4FYrUMz+hacWLoKM8hBLzvaMXOttY86E1X46cfrWllJz79HsI1hGoVQQLDwqv5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH5mdJxs02cGJW8KY/mPwVMKJ3qF/uXTKuxyw34UPJZOXvPKhY
	qxOxQhrwAMpCe2xkKasaAtIV7I37t9LT4XtQX4FWC9e1UvMsTkVQiUvO+rL7xRIh8Q==
X-Gm-Gg: ASbGnctfQgpQtodOyWZokN4AoRlQ+YwNQjqn+P0hj2q+ujNlQzhaDXo/whEYEg/vUE0
	UnQQ3lpl6p60vmO7BuBlrAfcbARetwJupJ4qX3vES3IWePcRqcVY+yq8mGJIwNvUmkgyyUawT8a
	FUaiWdi3GwXLnz7N1B1xVNoJYGCyI4oTpU+UHoqwVNbcunbDVVbsPpbmMB00m81iIaLE+Jsm1gH
	DGUBmmSWqiHXQYMZxIUXbaFjgnWjiaXNLzkTIsvjxRos+XTGWztTN3d9HFd6Uggm1silUwWOu9M
	iHzku1e0DfpZGVktu//bpqv6tV63HWDT/xdHV7jIGDccVK4o6oPuLpakK6gPBuHQuWHtLcU8tNx
	Vqom7HkKsLOMtDAQ9OFNswvZNeJ9slQY0n+0=
X-Google-Smtp-Source: AGHT+IE0IABp03aQi/MMdsx50TsZhfjlS77ZjBf2ZnkWRLyJkwYN80FXKFOnWqqtHBqMUe2X9qwO7Q==
X-Received: by 2002:a05:6a00:228b:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-748fb7cc2d2mr4770370b3a.24.1750344599760;
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
Received: from [10.229.43.247] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b569sm84792b3a.20.2025.06.19.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Colin Ian King <colin.i.king@gmail.com>, Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 19 Jun 2025 16:49:53 +0200
Message-ID: <19788aaee68.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250619082554.1834654-1-colin.i.king@gmail.com>
References: <20250619082554.1834654-1-colin.i.king@gmail.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [PATCH][next] wifi: brcmfmac: Make read-only array cfg_offset static const
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 19, 2025 10:26:15 AM Colin Ian King <colin.i.king@gmail.com> wrote:

> Don't populate the read-only array cfg_offset on the stack at run time,
> instead make it static const.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> .../broadcom/brcm80211/brcmfmac/pcie.c        | 24 ++++++++++---------
> 1 file changed, 13 insertions(+), 11 deletions(-)


