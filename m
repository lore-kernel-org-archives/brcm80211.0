Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D422481C4
	for <brcm80211@lists.linux.dev>; Fri, 16 May 2025 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747373274; cv=none; b=AqRpbMXZpdIpIvBK5BD1vFYTtyymxVxR6eLLn1ms3qO5f61zFYLUMsvqm2hQx+oz6arg2P58JIe3SW+alepq41Gu41Jx9sXdeZnqLqvbzk38RCKNld8XgJf1TJSUYiPgX9ppMKhGwjSkcUSfdLiwi89LXZqHOqH2Tptt7g3NtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747373274; c=relaxed/simple;
	bh=1oSZB6Mh1Am7IMLdTq+rGuRVJdFYyBZOmT8eJB3H1zI=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oAsg2MgrqHJVe+0p7CWNFMXQn5PeV5ORfcQEPUfaGgS8Rst1ubnfn++f5a6yB359/vJ+wS+shB3wXQV/bbfUOELVUUvZzrqDKfEBmi+waKpwfMEB55l79lnbqHRQ6yjOEkvYkXdZADXZKmufk9omVRWm0PJ5SfltrOqYttg3ggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JnApr/vD; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JnApr/vD"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1390744a12.1
        for <brcm80211@lists.linux.dev>; Thu, 15 May 2025 22:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747373272; x=1747978072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZBuwCPrPwQtjwCCR2X3I/7gHQ/hXUDgt194Kz7I8QY=;
        b=JnApr/vDLvPTbSyCR/X9J0M7RlmdKrQKJ2xs2BkGmcvf7pAEB0h+ZnxgJqx5XxIB53
         PoFRfa+oQfpdOa5Nyuvbi31ii1OVXtfY3XzD4sDgOMcRftcABpXbtL1slz/ogetkays3
         4aGrMgwN6YkKgPr2WT+Xwr8eqPWGBkKmadKPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747373272; x=1747978072;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZBuwCPrPwQtjwCCR2X3I/7gHQ/hXUDgt194Kz7I8QY=;
        b=pHv3ME0iTpm0evMxpsqwOvyUY4MrQduEqPvidwhM55gzMXPKdw7R5bB0a3omPHbD7u
         WfDiZHmuE4I2RX95jGTRhzfZDJw5CKU/OO+tveArAoqLKZSdq3HcMxPT1WXzJShLSdBV
         oXe60482vIiTJtJy4yMI57NBs4IfIgmlPFCmQwZ8/a0vLb62MVyFPBOMgsvoxiqOSFNx
         q1esohhVODQBp0pSHTTZ2dyalPIfSgN/+2iWJI5BeOrUfLpQvD9oInWfHnelTkj9dfnp
         ef33KjLDTjTdg1oXrPm+2p/yQIOYe6Qgj+AlUrRzTBK3Us7MEhtJOSUzrL5Trp31OKAU
         Ew/Q==
X-Gm-Message-State: AOJu0YwHIptMRKowWsDIz97jwrhgev21grSgdsTu1W8JeUAAn4sEJkn9
	3NQZRcF/1MSaI6zsBwYnzl+eZ3uH4+EbH48ZonU4H6UrGrs8pkk+tHcEcf0QGPpgFw==
X-Gm-Gg: ASbGnct63zWq993GgyoEThOY3WdvrMtAPM4gY74BJwjWh1TVKf7/2QxmYsSOVPdir14
	k+m6XUXfd20vf6Kt5dWVgQp1NSUpudbvy6VD/Wjciv4Jxd+nPowagpFyIN3VcZiSthiXWlJWD3O
	E+gM7gR41dvyYfQS41CNi+RXU2qfHUuyA9UwKwYn5R/fOtl1S3zrTYb+fHPEM4VWvN/HhIEPPfY
	yRAGuzNaXmiHQDOIL9T5kBuOITkuSpOSPGQtWCWjy+TSnKur4TjwZxPSv6saffudLcaQwIIqD4D
	EiPvzShsDTNGtvwwWYImAwHSFwuK6gLIMGYo948SJQ52qp3IqquaU66sGZP/g2Jd2LkBaE+4tG+
	Ads/10yYUz7Yo7Q==
X-Google-Smtp-Source: AGHT+IHzdRkavZNG2fH2v8Z0BOuTPgetkh5gljeFa8VxHHd/7/RqRh+tQvkq/QvGyYWTH/y9hSthyg==
X-Received: by 2002:a17:902:da91:b0:215:a303:24e9 with SMTP id d9443c01a7336-231d4ae1de4mr23968985ad.3.1747373271695;
        Thu, 15 May 2025 22:27:51 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e76b4d5bsm1643655ad.111.2025.05.15.22.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 22:27:51 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Tim Harvey <tharvey@gateworks.com>
CC: <brcm80211@lists.linux.dev>, Johannes Berg <johannes@sipsolutions.net>, "linux-wireless" <linux-wireless@vger.kernel.org>
Date: Fri, 16 May 2025 07:27:45 +0200
Message-ID: <196d7901068.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAJ+vNU2pLJd696Fc_98arrzs8QK70HfstPrZv6zVJm3G13REHQ@mail.gmail.com>
References: <CAJ+vNU2pLJd696Fc_98arrzs8QK70HfstPrZv6zVJm3G13REHQ@mail.gmail.com>
User-Agent: AquaMail/1.55.0 (build: 105500550)
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth support for Infineon devices
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On May 16, 2025 2:38:51 AM Tim Harvey <tharvey@gateworks.com> wrote:

> Hi Arend,
>
> Thanks for this series! This allows WPA3 Personal in STA mode on a
> CYW4373E based module we use on our boards however AP mode with WPA3
> Personal does not appear to work. Do you know what is needed to allow
> WPA3 Personal in a CYW4373E AP?

Hi Tim,

I did not look into AP mode (yet). Are you using hostapd as authenticator. 
Can you provide the conf file?

Regards,
Arend



