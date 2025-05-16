Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435E28EA
	for <brcm80211@lists.linux.dev>; Fri, 16 May 2025 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355933; cv=none; b=LbiKxhfDPrETsthFVyfH6em3T5p5NOPleU/YRvXM3Fl0fP93TGOCYDTfkY+SBGgKeS0XxPPKAVM8cBhkuwEuZ9iQhr2LAOWP3Z6D08Sm2zlh2bE8UfST3iXhYIe0jzhchoJTSKTYn3aauMcumYZD337urB+zRnEgZKSmyX29Aeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355933; c=relaxed/simple;
	bh=rv8k0wyEoKPUYTeLSMzP7hCq20sWkhmDbO98OIYmMHc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ATNNx07LOrvyGHCMU0SUeQElSLx+sqM1kJ/7OcU7Pgaz9rhfA8nLsk4IVi97EeKqxeX0OX6C/rR/3WSICKGeeXliQceutBnCbLSxub2I4R/aF3+sUnxLzu0IRMriwVN/qS9GMKQkhT0sSAiQ2QbKW1+fWV2OTjLYgJSIx/C0AYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=Y7++FfaA; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="Y7++FfaA"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70a2970cb70so15095097b3.0
        for <brcm80211@lists.linux.dev>; Thu, 15 May 2025 17:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1747355930; x=1747960730; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rv8k0wyEoKPUYTeLSMzP7hCq20sWkhmDbO98OIYmMHc=;
        b=Y7++FfaAHbo3BzyVFtLRh9lGSgAsCYvbZZuYFbq5BSd9GIRX7AC4R/+9nFiusLlIGM
         dZbedB0TGU0fmhyvLvgmvYP+TuFmV/Wqwl+3Bhnt5vpY3rRzhB517gx8rRovdspRHoKK
         2P2RtVrTK/k6HcfgItFFWgZ+YJ3LjJaF5tCXxTBbfUMXhRDbqQtI4wj3UEiAtU579euF
         gndTa6hRoflZIgTNkNPqyQNvNJQhedQFtw654ClnKFkeQXPnZBCSeOEuP1g10KI685o/
         r1F9gMXx0urQwXyxF95Ihk2qA44k29Y+67SuyM0dTZpAcSZ6VLtoU1wmbYxP+hCpGLYP
         khFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355930; x=1747960730;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rv8k0wyEoKPUYTeLSMzP7hCq20sWkhmDbO98OIYmMHc=;
        b=pzIt3Yh7/LLDt/WMcA3/0/fuhaGgTGqcKB37W8FIeqO+Qs3Cn/GD3oR12SgAAaKgOE
         8a4+8RTKMp+eArGDZv8Te4/LC8JMeK81rGg9dGtM9pqiKe0j4nHE63afWTXQcRWIq4fR
         V0hyZvpewVORNZ5cuSX9XjXoKN+iYeEU9gUQQUyafhK0sRDiX5fd2AnLEIaBI3IIvdrW
         SlNuTn9vFzx6m4bdRN+JyiYBKesbPGuHoqbw2uC0igBY6t2/Rdsp9OtqofGb1Zaj3Imw
         QNT/NfBIWW1DPLdoubO7aERM07BOko6mTppDbQ1ys2nkkkbmdy9a8DSNkT3LdvWD4lWU
         Cz4A==
X-Gm-Message-State: AOJu0YxaehAdjgpZmQH7rY5gj8udK2SZPjiUX/AG0iyGhXS2fXJ6W2lj
	3iidZYQ7n8kR2vcGDVxlv3ON6QMzuiGdSMD4iSO20jC8P4cYWN4zw00vjyPQ7kYeXoU+M7E8SD7
	da3LbhEHVtF/JaH+0Cl0Q5VmHfIkPSGcSJWVzzQV54Q==
X-Gm-Gg: ASbGncsfqnzaRIgelbgPovXl0O6ha9s08ScxKz/IDqP4ZgdDtOcPiWIB5HU1udtQdTJ
	d4n0rLso0iFmNZdUtxkHC6isKbxQnMu24OYq66Sk+KdpCwsV5AQaCDZprw8mwNPK9PEuYcU2GQx
	Ri2pEs19XYEYKKVLYnSirJU+fgOMGX6Ng5002L2DyeDlk=
X-Google-Smtp-Source: AGHT+IFRpXGKDPWrLmfhwlXxhUUwIzv8YoXZz3lTpbIBPWH+XJCxnhvJTLL2KDmJ1ao92uXFoEyzYAlWmI0MBwDW1Yk=
X-Received: by 2002:a05:690c:b8e:b0:702:d85:59b5 with SMTP id
 00721157ae682-70ca7bade9bmr27437477b3.33.1747355930425; Thu, 15 May 2025
 17:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 15 May 2025 17:38:39 -0700
X-Gm-Features: AX0GCFtchIFFxA06JruNHyaVUxwAeZUAjl7Me10PnolLIUMyP_CwgT3Ej-tDxjI
Message-ID: <CAJ+vNU2pLJd696Fc_98arrzs8QK70HfstPrZv6zVJm3G13REHQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth
 support for Infineon devices
To: arend.vanspriel@broadcom.com
Cc: brcm80211@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arend,

Thanks for this series! This allows WPA3 Personal in STA mode on a
CYW4373E based module we use on our boards however AP mode with WPA3
Personal does not appear to work. Do you know what is needed to allow
WPA3 Personal in a CYW4373E AP?

Best Regards,

Tim
