Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A4378D92
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785103935; cv=none; b=s0DoBNFJ2l65euz3iaMJbP+qFSUgWIu8WgaSX+WKb+LUpUuyQz2vs2w4oplfmKA5WhekjfP66SG/iI4TYGdBHSMqcgOmgQf21hE9jTHvQxpvZfb1veJEK/MVDKk6laaevnKElDcELwzDP/87Q3MwB24tz1gasPgd+lPupTNELqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785103935; c=relaxed/simple;
	bh=XirBAzOzE0ihAUqfnuAp2o8HAi5p7wNO+MkVNs1T5Uo=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=WPFcEGZ57kIWSbTHoeHlxjHkIzvRIpX3GbfZ6M6twSyWAUqn+O7Tpbyanz2XsOQyXPD1yej8eaME9uZnT75+nUC82bcuGKP/1H/zE/XN15W1BN6zCcOH/dAV5Zkrc/XoZ7SGAVEOWbZqgDKBgYvX34TnEceRE/ASYjOgXHdHq5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dOS3Jy1U; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dOS3Jy1U"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2cf452def93so24671335ad.1
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 15:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785103933; x=1785708733;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XirBAzOzE0ihAUqfnuAp2o8HAi5p7wNO+MkVNs1T5Uo=;
        b=ZYvJutvdVwEAnJQh7omzkhQOkulzpmubcXZ4lJ2HCGzYoEbL4KcQ2vu2ZxpqyHVphK
         FWSzdT/QMpr1t2lyZYcfnClaKMHw1soQbDv6xeAd7zyuDo7mLby4MbVeCfutKq87Lg7r
         eUj3ao+pwIwZwTqzFzwhk95Kprj0e7Pwc5AM/kt/Rwt7ZFF66iiqjMueIXlqpAq2l3Hp
         ZBEWbcIkgkq3Cf1J8U8HQqFxFvbCsF+ogqyOCwgopYPIb/t48s4w8AWwG/LewDdgOUta
         ge2zm7L0stVQ0vOdn60vjrnQSg0T/iwn7ApgIgSKq1A17bXuiaLHj9xqTFo/3O5Fb9VL
         QeBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rruf8zSwhC2AKZjMFb/mjKjPiFJDbKuEdpOvoQbI80G7ddYYwGvy4oKNJ+RgvwpEClH7JhkwCmOKvs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgCh9ufvPHCRWvC3BASDMRjG8iJrr8LSRIZXmjNZRBsghEU9WU
	f6lpAfPWndktqDY5kAly3ZZPbSJVHI5zqXIPjwLsMHV/4G5vdBXmyVW3uPh5haTQ8xHxZGvV4qn
	PtaBeFm2iFwP4oxr5RWu5zHQQfve8bn3XIVc0BcfJ/gv2HLGyoeeNPDgwWYn27PTSPnc5XSpJT2
	PHkWIQhDOXwEcfUptjbbot3b6BUGtbgWF7udem50rc54JWyDOXXGrLYFhgN/JyfkQt+cvw4p+p+
	Kh2uo6Cqsh3Rc+Lt8NHJg==
X-Gm-Gg: AR+sD10e1wmjYrwD9ni3ebDj6LHWIRg+Gw55i7yghcrBm3iqgKeQX9er/ie53a6VVgG
	m6tOzLuCYMUAjhaCyHkodPHJCNiD96hPhcqrwPJcX6Ou/qE2G7tcbSXw63c6k5DlnOC1Yczzgy+
	jX9NedVt9KHS2jERlQBt9AqmOnODM+7qZUWYUfJUqebeBuk8wos81AoYfsUT6vTmU+tEQUmgluf
	HOZXtgwYtXsWqFO3p3+Oi7mKU4S3TUbJky0i0BMbkHOSAKOjHTCTkyQUHbbspsHWz/lq5ut0M2i
	LZ6yWmxh/hYGloKX3YgSHvZDuW6tu0s502c5XD7OywW+jX269Bl2bldYIacDIwmrPK/TEopQ8gl
	5qgPgAlvUb5MOFvCODL5hXBnMxnqon58afRXDUWlv5VjQ1iAbNRrvqt7yAKebFP7pz8KpgXi+n7
	Btfcceiwm5RoDN0YW3NwsbUXlznLVe5XVOFaoEuUY=
X-Received: by 2002:a17:902:e803:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2cfdf3f056amr51306515ad.14.1785103933458;
        Sun, 26 Jul 2026 15:12:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde5be0ddsm5490295ad.21.2026.07.26.15.12.12
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:12:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-69f4a9eaa68so2852213a12.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785103931; x=1785708731; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XirBAzOzE0ihAUqfnuAp2o8HAi5p7wNO+MkVNs1T5Uo=;
        b=dOS3Jy1U+wcYOxdXQFDfNOa/Ynav3U56tyN5lTYOA8azOYJT7PDxe1j6HS5LlWS+za
         kmOdxtETy7HEPK9Q5FovFo8MoiS1kj5rHNTyhnaGTgSS/aociR4HWdJlQnA0WOzlNZSG
         PHNG/gpxWeY0QwjdZAiO267BjLgPPy+H+HNyw=
X-Forwarded-Encrypted: i=1; AHgh+Rrcf7e6f7NNNmy2iAA2e+mgZZWg0zGrxJtj3v0XLaHBOBRKdugJXxe2QEE4l39ED/eZ9sC1eqvPCjg=@lists.linux.dev
X-Received: by 2002:a05:6402:5188:b0:69f:4c65:8696 with SMTP id 4fb4d7f45d1cf-69fc100510dmr2460863a12.11.1785103931573;
        Sun, 26 Jul 2026 15:12:11 -0700 (PDT)
X-Received: by 2002:a05:6402:5188:b0:69f:4c65:8696 with SMTP id 4fb4d7f45d1cf-69fc100510dmr2460856a12.11.1785103931164;
        Sun, 26 Jul 2026 15:12:11 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm1918044a12.31.2026.07.26.15.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:12:10 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Mon, 27 Jul 2026 00:12:09 +0200
Message-ID: <19fa07c4ea8.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <78e9e3c667a7e356cfd2f736fd5852c91bd7cbf4.camel@sipsolutions.net>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
 <20260726192541.2816743-11-arend.vanspriel@broadcom.com>
 (sfid-20260726_212621_952206_40730C54)
 <78e9e3c667a7e356cfd2f736fd5852c91bd7cbf4.camel@sipsolutions.net>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH -next 10/10] wifi: cfg80211: convert cookie output to input parameter
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 26 juli 2026 21:38:03 schreef Johannes Berg <johannes@sipsolutions.net>:

> On Sun, 2026-07-26 at 21:25 +0200, Arend van Spriel wrote:
>> The tx_control_port op is excluded: its cookie pointer is nullable
>> (passed as NULL when dont_wait_for_ack is set), so the nullable
>> pointer semantics are still required.
>
> Well, kind of? Since we guarantee non-zero cookies, we could just pass
> zero for this case, maybe that'd be nicer here?

Crossed my mind as well. Will look into it.

Gr. AvS



